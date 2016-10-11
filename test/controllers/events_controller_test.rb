require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end
end
