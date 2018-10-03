require_relative 'boot'
require 'rails/all'
require 'coderay'

Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    config.load_defaults 5.1
    config.generators.system_tests = nil
    config.encoding = "utf-8"
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.assets.precompile += %w( .svg .eot .woff .ttf )
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :pl
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.time_zone = 'Warsaw'
  end
end
