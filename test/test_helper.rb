ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'authlogic/test_case'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all
  
  # Add more helper methods to be used by all tests here...
  # Add more helper methods to be used by all tests here...
  def assert_layout(layout)
    assert_equal layout, @response.layout
  end
  
  def assert_format(format)
    assert_equal format.to_sym, @request.format.to_sym
  end
  
  def controller_path
    @controller.controller_path
  end
  
  def path_with_action(action, options={})
    { :controller => controller_path, :action => action }.merge(options)
  end
  
end

# Setup AuthLogic for functional tests
class ActionController::TestCase
  setup :activate_authlogic
end