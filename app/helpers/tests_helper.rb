# frozen_string_literal: true

module TestsHelper
  TEST_LEVELS = { 0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard }.freeze
  
  def test_header(test)
    action = test.new_record? ? 'Create' : 'Edit'

    "<h1>#{action} #{test.title} Test</h1>".html_safe
  end

  def test_level(test)
    TEST_LEVELS[test.level] || :hero
  end
end
