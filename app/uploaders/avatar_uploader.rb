class AvatarUploader < CarrierWave::Uploader::Base
  storage :upyun

  def filename
    if original_filename 
      @name ||= Digest::MD5.hexdigest(File.dirname(current_path))
      "#{@name}.#{file.extension}"
    end
  end
end
