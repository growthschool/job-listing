require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get jobs" do
    get admin_jobs_url
    assert_response :success
  end

end
