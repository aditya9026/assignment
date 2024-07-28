require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content = FactoryBot.create(:content, title:  "incubyte", body: 'test', published: false)
  end

  test "should get index" do
    get contents_url
    assert_response :success
  end

  test "should show content" do
    get content_url(@content)
    assert_response :success
  end
end