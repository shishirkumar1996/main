Rails.application.configure do
  require 'omniauth'
	require 'omniauth/facebook'
	config.middleware.use Rack::RequestProfiler
	#config.middleware.use Rack::RubyProf,path: '/tmp/rails_profile'
		config.action_controller.default_url_options = {host: 'localhost:3000'}
 #config.log_level = :debug
 config.cache_classes = true
 #config.action_controller.consider_all_requests_local = false
 config.action_controller.perform_caching             = true
 config.action_view.cache_template_loading            = true
 config.logger = Logger.new(STDOUT)
 
 config.eager_load = false
 #config.assets.precompile += ['*.js','^[^_]*.css','*.css.erb','*.png',
 #'*.jpg','*.jpeg','*.gif','*.svg','*.ico','*.eot','*.ttf','*.woff']



 config.cache_store = :memory_store
 
 config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false


  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false


  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new
	
	
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger = ActiveSupport::TaggedLogging.new(logger)
  end
	config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.active_record.dump_schema_after_migration = false
 
 
 ##change this to false before pushing the code to production ###
 config.public_file_server.enabled = true
 #################################################################
 
 
end
