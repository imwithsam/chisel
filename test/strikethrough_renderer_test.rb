require './test/test_helper'
require './lib/strikethrough_renderer'

class StrikethroughRendererTest < MiniTest::Test
  def test_it_renders_a_simple_strikethrough
    input = "~~Strike~~"
    expected = "<del>Strike</del>"

    actual = StrikethroughRenderer.render(input)

    assert_equal expected, actual
  end

  def test_it_renders_multiple_strikethroughs
    input = "Strike through ~~this~~ and ~~that~~."
    expected = "Strike through <del>this</del> and <del>that</del>."

    actual = StrikethroughRenderer.render(input)

    assert_equal expected, actual
  end
end

