module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage.to_s)
        img = yield(img) if block_given?
        img
      end
    end
  end
end

CarrierWave.configure do |config|
  config.ftp_host    = ENV['FTP_HOST']
  config.ftp_port    = 21
  config.ftp_user    = ENV['FTP_USER']
  config.ftp_passwd  = ENV['FTP_PASSWORD']
  config.ftp_url     = ENV['FTP_URL']
  config.ftp_folder  = ENV['FTP_FOLDER']
  config.ftp_passive = true
  config.ftp_tls     = false
end
