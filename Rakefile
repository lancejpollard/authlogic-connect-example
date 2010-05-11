# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

Rails::Application.load_tasks

def to_string_hash(source, separator = ".", target = {}, namespace = nil)
  prefix = "#{namespace}#{separator}" if namespace
  case source
  when Hash
    source.each do |key, value|
      to_string_hash(value, separator, target, "#{prefix}#{key}")
    end
  when Array
    source.each_with_index do |value, index|
      to_string_hash(value, separator, target, "#{prefix}#{index}")
    end
  else
    target[namespace] = source
  end
  target
end

task :heroku_vars do
  require 'config/initializers/authlogic_connect_config.rb'
  puts AuthlogicConnect.config.inspect
  vars = to_string_hash(AuthlogicConnect.config, "_")
  command = "heroku config:add "
  vars.each do |k,v|
    command << "#{k.to_s.upcase}=#{v.to_s} "
  end
  
end