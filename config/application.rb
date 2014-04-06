require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'coderay'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Blog
  class Application < Rails::Application
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.assets.precompile += %w( .woff )
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.time_zone = 'Warsaw'
  end
end
