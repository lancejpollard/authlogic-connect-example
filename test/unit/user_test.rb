require 'test_helper'

class UserTest < Test::Unit::TestCase
  context "User creation" do
    setup do
      @user = User.new(:login => "viatropos")
    end

    should "make sure we are loading the models" do
      assert_equal "viatropos", @user.login
    end
    
    context "responds to added oauth methods (our oauth api on the user)" do
      
      should "have 'tokens' method" do
        assert @user.respond_to?(:tokens)
        assert_equal [], @user.tokens
      end
      
      should "have 'active_token' method" do
        assert @user.respond_to?(:active_token)
        assert_equal nil, @user.active_token
      end
      
    end
  end
  
end
