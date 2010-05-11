puts "REQUIRED ENGINE"
require "authlogic-connect"
require "rails"

module AuthlogicConnect
  class Engine < Rails::Engine
  end
  
  initializer "authlogic_connect.add_middleware" do |app|
    app.middleware.use AuthlogicConnect::CallbackFilter
  end
end