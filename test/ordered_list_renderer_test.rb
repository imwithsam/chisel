require './test/test_helper'
require './lib/ordered_list_renderer'

class OrderedListRendererTest < MiniTest::Test
  def test_renders_one_ordered_list_item
    input = "1. List item 1\n"
    expected = "<ol>\n" \
                "  <li>List item 1</li>\n" \
                "</ol>\n\n"

    actual = OrderedListRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_multiple_ordered_list_items
    input = "1. List item 1\n" \
            "2. List item 2\n" \
            "3. List item 3\n"
    expected = "<ol>\n" \
                "  <li>List item 1</li>\n" \
                "  <li>List item 2</li>\n" \
                "  <li>List item 3</li>\n" \
                "</ol>\n\n"

    actual = OrderedListRenderer.render(input)

    assert_equal expected, actual
  end
end
