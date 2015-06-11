require './test/test_helper'
require './lib/link_renderer'

class LinkRendererTest < MiniTest::Test
  def test_renders_link
    input = "[an example](http://example.com/)"
    expected = "<a href='http://example.com/'>an example</a>"

    actual = LinkRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_a_link_after_text
    input = "this is [an example](http://example.com/)"
    expected = "this is <a href='http://example.com/'>an example</a>"

    actual = LinkRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_a_link_in_text
    input = "this is [an example](http://example.com/) with more"
    expected = "this is <a href='http://example.com/'>an example</a> with more"

    actual = LinkRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_a_link_with_title
    skip
    input = "this is [an example](http://example.com/ \"Title\") with a title"
    expected = "this is <a href='http://example.com/' title='Title'>an example</a> with title"

    actual = LinkRenderer.render(input)

    assert_equal expected, actual
  end

  def test_renders_multiple_links_in_text
    input = "this is [an example](http://example.com/) with [a second link](http://turing.io/) and more"
    expected = "this is <a href='http://example.com/'>an example</a> with <a href='http://turing.io/'>a second link</a> and more"

    actual = LinkRenderer.render(input)

    assert_equal expected, actual
  end
end

