require './test/test_helper'
require './lib/renderer'

class RendererTest < MiniTest::Test
  def test_renders_markdown
    input = "# This is an *emphasized* header.\n\n" \
            "This is a **strong** paragraph.\n"
    expected = "<h1>This is an <em>emphasized</em> header.</h1>\n\n" \
                "<p>\n  This is a <strong>strong</strong> paragraph.\n</p>\n\n"

    actual = Renderer.render(input)

    assert_equal expected, actual
  end

  def test_passes_acceptance_test
    input = "# My Life in Desserts\n\n" \
            "## Chapter 1: The Beginning\n\n" \
            "\"You just *have* to try the cheesecake,\" he said. " \
            "\"Ever since it appeared in **Food & Wine** this place " \
            "has been packed every night.\"\n\n"
    expected = "<h1>My Life in Desserts</h1>\n\n" \
                "<h2>Chapter 1: The Beginning</h2>\n\n" \
                "<p>\n  \"You just <em>have</em> to try the cheesecake,\" he said. " \
                "\"Ever since it appeared in <strong>Food & Wine</strong> this place " \
                "has been packed every night.\"\n</p>\n\n"

    actual = Renderer.render(input)

    assert_equal expected, actual
  end
end
