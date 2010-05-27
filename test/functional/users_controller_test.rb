require File.dirname(__FILE__) + '/../test_helper'
class UsersControllerTest < ActionController::TestCase

  tests UsersController

#  should_filter_params :password

  context "when signed out" do
    #setup { sign_out }

    context "on GET to #new" do
      
      setup { get :new }

      should_respond_with :success
      should_render_template :new
      should_not_set_the_flash

    end
    
    context "on POST to #create" do
      
      setup { post :create }
      
      should "do something?" do
        
        puts "#{@request.inspect}"
        
      end
      
    end
    
  end
  
end