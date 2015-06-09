require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/strong_renderer'

class StrongRendererTest < MiniTest::Test
  def test_renders_strong
    input = "I want to **strong** this."
    expected = "I want to <strong>strong</strong> this."

    actual = StrongRenderer.render(input)

    assert_equal expected, actual
  end
end

