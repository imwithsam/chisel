require 'pry'
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
            "\"You just *have* to try the cheesecake,\" he said. \n" \
            "\"Ever since it appeared in **Food & Wine** this place \n" \
            "has been packed every night.\"\n\n" \
            "My favorite cuisines are:\n\n" \
            "* Sushi\n" \
            "* Barbeque\n" \
            "* Mexican\n\n" \
            "My favorite cuisines are:\n\n" \
            "1. Sushi\n" \
            "2. Barbeque\n" \
            "3. Mexican\n\n" \
            "This is [an example](http://example.com/) inline link, and here is [another example](http://badmotivator.io/).\n\n"

    # input = "# My Life in Desserts\n\n" \
    #         "## Chapter 1: The Beginning\n\n" \
    #         "\"You just *have* to try the cheesecake,\" he said. " \
    #         "\"Ever since it appeared in **Food & Wine** this place " \
    #         "has been packed every night.\"\n\n"

    expected = "<h1>My Life in Desserts</h1>\n\n" \
                "<h2>Chapter 1: The Beginning</h2>\n\n" \
                "<p>\n  \"You just <em>have</em> to try the cheesecake,\" he said. \n" \
                "\"Ever since it appeared in <strong>Food & Wine</strong> this place \n" \
                "has been packed every night.\"\n</p>\n\n" \
                "<p>\n  My favorite cuisines are:\n</p>\n\n" \
                "<ul>\n" \
                "  <li>Sushi</li>\n" \
                "  <li>Barbeque</li>\n" \
                "  <li>Mexican</li>\n" \
                "</ul>\n\n" \
                "<p>\n  My favorite cuisines are:\n</p>\n\n" \
                "<ol>\n" \
                "  <li>Sushi</li>\n" \
                "  <li>Barbeque</li>\n" \
                "  <li>Mexican</li>\n" \
                "</ol>\n\n" \
                "<p>\n  This is <a href='http://example.com/'>an example</a> inline link, and here is <a href='http://badmotivator.io/'>another example</a>.\n</p>\n\n"

    actual = Renderer.render(input)
binding.pry
    assert_equal expected, actual
  end
end
