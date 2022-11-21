require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  test "should get request-quote" do
    get quotes_request-quote_url
    assert_response :success
  end

end
