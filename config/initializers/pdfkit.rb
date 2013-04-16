PDFKit.configure do |config|      
  config.default_options = { page_size: 'A4', encoding: "UTF-8", print_media_type: true }
  config.wkhtmltopdf = Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s if Rails.env.production?  
end
