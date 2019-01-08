require 'test_helper'

class ResolutionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    Resolution.create!(  
      title: "Goal 1",
      goal: 100,
      unit: "tests",
      start_date: Date.new(2019, 1, 1),
      end_date: Date.new(2019, 12, 31),
      user: User.first
    )

    sign_in User.first
  end

  test "index assigns all resolutions" do
    get resolutions_url 
    assert_response :success
    resolutions = @controller.instance_variable_get("@resolutions")
    assert_not_equal(resolutions, nil)
  end

  test "root redirects to /resolutions" do
    get root_url 
    assert_response :redirect
    assert_redirected_to(resolutions_url)
  end
end
