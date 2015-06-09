require './test/test_helper'
require './lib/chunker'

class ChunkerTest < MiniTest::Test
  def test_chunks_based_on_double_new_lines
    input = "# This is a header.\n\n" \
            "This is a paragraph.\n"
    expected = ["# This is a header.", "This is a paragraph.\n"]

    actual = Chunker.chunk(input)

    assert_equal expected, actual
  end
end

