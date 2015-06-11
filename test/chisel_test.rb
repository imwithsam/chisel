require 'simplecov'
SimpleCov.start
require './test/test_helper'
require './lib/chisel'

class ChiselTest < MiniTest::Test
  def test_reads_and_writes_files
    input_file = "./test/test.markdown"
    output_file = "./test/test.html"

    Chisel.run(input_file, output_file)

    assert File.exist?(input_file), "#{input_file} does NOT exist!"
    assert File.exist?(output_file), "#{output_file} does NOT exist!"
  end
end

