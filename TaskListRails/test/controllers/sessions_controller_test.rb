require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    get :create,  {provider: "github"}
  end

  test "can create a user" do
    assert_difference('User.count', 1) do
      login_a_user
      assert_response :redirect
      assert_redirected_to tasks_path
    end
  end

  test "User will not login in twice and create another user" do
   assert_difference('User.count', 1) do
     login_a_user
   end
   assert_no_difference('User.count') do
     login_a_user
     assert_response :redirect
     assert_redirected_to tasks_path
   end
 end

end
