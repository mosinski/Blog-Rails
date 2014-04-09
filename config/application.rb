require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'coderay'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module Blog
  class Application < Rails::Application
    config.after_initialize do
      Disqus::defaults[:account] = "mioszosiskiblog"
      Disqus::defaults[:developer] = true
      Disqus::defaults[:container_id] = "disqus_thread"
      Disqus::defaults[:show_powered_by] = false
    end
    config.encoding = "utf-8"
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.assets.precompile += %w( .woff )
    config.active_record.whitelist_attributes = true
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :pl
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.time_zone = 'Warsaw'
  end
end
