require 'test_helper'

class InstrumentsControllerTest < ActionDispatch::IntegrationTest
  test "should get instrument:string" do
    get instruments_instrument:string_url
    assert_response :success
  end

end
