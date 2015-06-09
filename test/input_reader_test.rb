require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/input_reader'

class InputReaderTest < MiniTest::Test
  def test_it_reads_a_file
    file_name = "test.markdown"
    expected = "# This is a header.\n\n" \
                "This is a paragraph.\n"

    actual = InputReader.read(file_name)

    assert_equal expected, actual
  end
end

