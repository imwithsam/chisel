require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/output_writer'

class OutputWriterTest < MiniTest::Test
  def test_it_creates_a_file
    file_name = "test.html"
    output = "<h1>This is a header.</h1>\n\n" \
                "<p>This is a paragraph.</p>\n"

    OutputWriter.write(output, file_name)

    assert File.exist?("test.html"), "#{file_name} does NOT exist!"
  end
end

