ENV['RAILS_ENV'] = 'test'

require 'rails'
require 'action_controller/railtie'
require 'rspec/rails'

module Dummy
  class Application < Rails::Application
    config.secret_key_base = 'dummy_key'
    config.eager_load = false
  end
end

Rails.application.initialize!
