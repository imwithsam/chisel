require './lib/input_reader'
require './lib/renderer'
require './lib/output_writer'

class Chisel
  def self.run(input_file, output_file)
    markdown = InputReader.read(input_file)

    output = Renderer.render(markdown)

    OutputWriter.write(output, output_file)

    output
  end
end

if !ARGV[0].nil? && !ARGV[1].nil?
  Chisel.run(ARGV[0], ARGV[1])
end

