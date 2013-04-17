class PictureUploader < CarrierWave::Uploader::Base
  storage :upyun

  self.upyun_bucket = ENV['PICTURE_UPYUN_BUCKET']
  self.upyun_bucket_domain = ENV['PICTURE_UPYUN_BUCKET_DOMAIN']

  def filename
    if original_filename 
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension.downcase}"
    end
  end
end
