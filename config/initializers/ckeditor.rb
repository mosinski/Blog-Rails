Ckeditor.setup do |config|
  require 'ckeditor/orm/active_record'
  config.assets_languages = ['en', 'pl']
  config.assets_plugins = ['image', 'smiley']
end
