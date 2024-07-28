require "test_helper"

class ContentTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "valid content creation" do
    content = Content.new(title: "Test Title", body: "Test Body")
    assert content.save
  end

  test "invalid content without title" do
    content = Content.new(body: "Test Body")
    refute content.save
    assert_equal ["Title can't be blank"], content.errors.full_messages
  end

  test "invalid content without body" do
    content = Content.new(title: "Test Title")
    refute content.save
    assert_equal ["Body can't be blank"], content.errors.full_messages
  end
end
