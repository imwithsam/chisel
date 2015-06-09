require './test/test_helper'
require './lib/header_renderer'

class HeaderRendererTest < MiniTest::Test
  def test_renders_h1
    input = "# This is a header."
    expected = "<h1>This is a header.</h1>\n\n"

    actual = HeaderRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_h2
    input = "## This is a header."
    expected = "<h2>This is a header.</h2>\n\n"

    actual = HeaderRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_h3
    input = "### This is a header."
    expected = "<h3>This is a header.</h3>\n\n"

    actual = HeaderRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_h4
    input = "#### This is a header."
    expected = "<h4>This is a header.</h4>\n\n"

    actual = HeaderRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_h5
    input = "##### This is a header."
    expected = "<h5>This is a header.</h5>\n\n"

    actual = HeaderRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_h6
    input = "###### This is a header."
    expected = "<h6>This is a header.</h6>\n\n"

    actual = HeaderRenderer.render(input)

    assert_equal expected, actual
  end
end

