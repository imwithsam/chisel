require './test/test_helper'
require './lib/output_writer'

class OutputWriterTest < MiniTest::Test
  def test_it_creates_a_file
    file_name = "./test/test.html"
    output = "<h1>This is a header.</h1>\n\n" \
                "<p>This is a paragraph.</p>\n"

    OutputWriter.write(output, file_name)

    assert File.exist?(file_name), "#{file_name} does NOT exist!"
  end
end

