# encoding: utf-8
class CkeditorPictureUploader < CarrierWave::Uploader::Base
  include Ckeditor::Backend::CarrierWave
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :ftp
  else
    storage :file
  end

  def store_dir
    "uploads/ckeditor/pictures/#{model.id}"
  end

  version :content

  version :mobile do
    process resize_to_limit: [400, nil]
    process quality: 80
  end

  version :thumb do
    process resize_to_limit: [80, nil]
    process quality: 80
  end

  def extension_white_list
    Ckeditor.image_file_types
  end
end
