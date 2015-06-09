require 'simplecov'
SimpleCov.start

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/chisel'

class ChiselTest < MiniTest::Test
  def test_reads_and_writes_files
    input_file = "test.markdown"
    output_file = "test.html"

    Chisel.run(input_file, output_file)

    assert File.exist?(input_file), "#{input_file} does NOT exist!"
    assert File.exist?(output_file), "#{output_file} does NOT exist!"
  end

  def test_parses_headers_and_paragraphs
    input_file = "test.markdown"
    output_file = "test.html"
    expected = "<h1>This is an <em>emphasized</em> header.</h1>\n\n" \
                "<p>This is a <strong>strong</strong> paragraph.</p>\n\n"

    actual = Chisel.run(input_file, output_file)

    assert_equal expected, actual
  end
end

