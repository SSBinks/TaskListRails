require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create a userwith no email, name or uid" do
    user = User.new
    assert_not user.valid?
  end




  # test "the User will not be valid without an email" do
  #   git_hash = {uid: 15, provider: "github",
  #     info: {nickname: 'kitty'}}
  #   user = User.build_from_github(git_hash)
  #   assert_not user.valid?
  #
  # end
end
