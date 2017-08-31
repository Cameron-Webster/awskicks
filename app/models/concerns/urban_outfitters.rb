module UrbanOutfitters
    def run

    @current_price = @browser.find('span.c-product-meta__current-price').text.gsub(/£/,"").to_f
    available_sizes = @browser.all "select#fit-sizes option:not(:disabled)"
    all_sizes = @browser.all "select#fit-sizes option"
    puts "available_sizes #{available_sizes.count}"
    all_sizes.each do |put|
      puts "all sizes #{put.text}"
    end
    @sizes = available_sizes.each_with_index.map do |size, i|
      size.text.split(" ").drop(1).map(&:to_f)
    end
    @sizes = @sizes.flatten
     @sizes.each do |s|
      puts s
      end
    end
  end
