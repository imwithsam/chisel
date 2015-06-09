require_relative 'input_reader'
require_relative 'renderer'
require_relative 'output_writer'

class Chisel
  def self.run(input_file, output_file)
    markdown = InputReader.read(input_file)

    output = Renderer.render(markdown)

    OutputWriter.write(output, output_file)

    output
  end
end

