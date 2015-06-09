require './test/test_helper'
require './lib/renderer'

class RendererTest < MiniTest::Test
  def test_renders_markdown
    input = "# This is an *emphasized* header.\n\n" \
            "This is a **strong** paragraph.\n"
    expected = "<h1>This is an <em>emphasized</em> header.</h1>\n\n" \
                "<p>This is a <strong>strong</strong> paragraph.</p>\n\n"

    actual = Renderer.render(input)

    assert_equal expected, actual
  end
end
