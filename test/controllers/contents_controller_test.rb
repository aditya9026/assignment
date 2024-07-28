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

  test 'should create content' do
    post contents_url, params: { content: { title: 'Test Content', body: 'Test Body' } }
    content = JSON.parse response.body
    assert_response :success
    assert_equal "Test Content", content['content']['title']
  end

  test "should update content" do
    patch content_url(@content), params: { content:  { title: "Updated Title" } }
    content = JSON.parse response.body
    assert_response :success
    assert_equal "Updated Title", content['content']['title']
  end

  test "should destroy content" do
    assert_difference('Content.count', -1) do
      delete content_url(@content)
    end
  end
end