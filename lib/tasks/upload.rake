
require 'csv'
namespace :upload do
  desc "bulk sneaker upload from file"

  task :sneakers => :environment do
      puts "starting upload"
    upload_file = ENV['file']
    sneaker_update_list = []
    CSV.foreach(upload_file, headers: true) do |row|

      f = row.to_hash
      puts f
      brand = Brand.find_by(name: f["sneak_brand"])
      puts brand

      next SpiderLog.info "Brand #{f['sneak_brand']} not found for sneaker: #{f['name']}" if brand.nil?
      photo_url = File.join("/Users/cameronwebster/code/Cameron-Webster/photo_uploads", f["photo"])
      next SpiderLog.info "#{f['name']}: image #{f['photo']} does not exist" if !File.exist?(photo_url)
      sneak_photo = File.open(photo_url)

      alt_sneak_photo = if f["alt_photo"]
      alt_photo_url = File.join("/Users/cameronwebster/code/Cameron-Webster/photo_uploads", f["alt_photo"])
      next SpiderLog.info "#{f['name']}: image #{f['alt_photo']} does not exist" if !File.exist?(alt_photo_url)
      File.open(alt_photo_url)
      else
        nil
      end

        sneak = Sneaker.new(
          name: f["name"],
          style_code: f["style_code"],
          brand: brand,
          sneak_brand: f["sneak_brand"],
          color: f["color"],
          gender: f["gender"],
          photo: sneak_photo,
          shoe_style: f["shoe_style"],
          alt_photo: alt_sneak_photo)


        if sneak.save
          SpiderLog.info "sneaker saved"
          (f.keys - sneak.as_json.keys).reject(&:nil?).each do |key|
            logo = Logo.find_by(name: key)
            next if logo.nil? || f[key].nil?
            vv = sneak.vendors.build(name: key, logo_id: logo.id, url: f[key])
            SpiderLog.info "vendor saved" if vv.save
          end
          SpiderWorker.perform_async(sneak.id) if sneak.vendors.any?
        else
         sneak.errors.full_messages.each do |error|
          SpiderLog.info error
         end
        end
      end
    end
  end
