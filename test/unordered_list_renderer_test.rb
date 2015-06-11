require './test/test_helper'
require './lib/unordered_list_renderer'

class UnorderedListRendererTest < MiniTest::Test
  def test_renders_one_unordered_list_item
    input = "* List item 1\n"
    expected = "<ul>\n" \
                "  <li>List item 1</li>\n" \
                "</ul>\n\n"

    actual = UnorderedListRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_multiple_unordered_list_items
    input = "* List item 1\n" \
            "* List item 2\n" \
            "* List item 3\n"
    expected = "<ul>\n" \
                "  <li>List item 1</li>\n" \
                "  <li>List item 2</li>\n" \
                "  <li>List item 3</li>\n" \
                "</ul>\n\n"

    actual = UnorderedListRenderer.render(input)

    assert_equal expected, actual
  end
end

