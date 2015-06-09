require './test/test_helper'
require './lib/paragraph_renderer'

class ParagraphRendererTest < MiniTest::Test
  def test_renders_paragraph
    input = "This is a paragraph.\n\n"
    expected = "<p>This is a paragraph.</p>\n\n"

    actual = ParagraphRenderer.render(input)

    assert_equal expected, actual
  end
end

