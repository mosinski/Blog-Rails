Blog::Application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.active_record.migration_error = :page_load
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.serve_static_files = false
  config.assets.js_compressor = Uglifier.new(harmony: true)
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.log_tags = [ :uuid ]
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_level = :info
end
