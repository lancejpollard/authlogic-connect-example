require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)

module AuthlogicConnectExample
  class Application < Rails::Application
    config.middleware.use AuthlogicConnect::CallbackFilter
    
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :haml
    end

    config.encoding = "utf-8"

    config.filter_parameters += [:password, :password_confirmation]
  end
end

Haml::Template::options[:ugly] = false
