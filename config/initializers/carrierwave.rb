if Rails.env.development?

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage)
        img = yield(img) if block_given?
        img
      end
    end
  end
end
end

CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJX4SJKMYVNLPG7IA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'eu-west-2',                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'aws-website-wishkicks'                          # required
  config.fog_public     = true                                       # optional, defaults to true
  config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}

end



