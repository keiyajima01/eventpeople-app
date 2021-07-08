require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      nickname: "Example User",
      email: "user@example.com"
    )
  
    test "should be valid" do
      assert @user.valid?
    end

    test "name should be present" do
      @user.nickname = ""
      assert_not @user.valid?
    end
  
    test "email should be present" do
      @user.email = ""
      assert_not @user.valid?
    end

    test "nickname should not be too long" do
      @user.nickname = "a" * 51
      assert_not @user.valid?
    end

    test "email should not be too long" do
      @user.email = "a" * 244 + "@example.com"
      assert_not @user.valid?
    end
  end
end
