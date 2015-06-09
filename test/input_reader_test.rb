require './test/test_helper'
require './lib/input_reader'

class InputReaderTest < MiniTest::Test
  def test_it_reads_a_file
    file_name = "./test/test.markdown"
    expected = "# This is an *emphasized* header.\n\n" \
                "This is a **strong** paragraph.\n"

    actual = InputReader.read(file_name)

    assert_equal expected, actual
  end
end

