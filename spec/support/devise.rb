require_relative './controller_auth'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  # config.extend ControllerAuth, type: :controller
end