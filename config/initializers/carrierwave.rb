CarrierWave.configure do |config|
  config.storage = :upyun
  config.upyun_username = ENV['AVATAR_UPYUN_USERNAME']
  config.upyun_password = ENV['AVATAR_UPYUN_PASSWORD']
  config.upyun_bucket = ENV['AVATAR_UPYUN_BUCKET']
  config.upyun_bucket_domain = ENV['AVATAR_UPYUN_BUCKET_DOMAIN']
end
