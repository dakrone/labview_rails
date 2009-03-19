require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    User.new(:username => "bilbo", :password => "baggins").save
  end

  test "authenicate correctly" do
    assert User.authenticate("bilbo", "baggins")
  end

  test "incorrect password" do
    assert !User.authenticate("bilbo", "bagns")
  end

  test "incorrect username" do
    assert !User.authenticate("bilbooooooooooo", "baggins")
  end
end
