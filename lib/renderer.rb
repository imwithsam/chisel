require_relative 'chunker'
require_relative 'emphasis_renderer'
require_relative 'strong_renderer'
require_relative 'header_renderer'
require_relative 'paragraph_renderer'

class Renderer
  def self.render(markdown)
    chunks = Chunker.chunk(markdown)
    parsed_chunks = self.parse(chunks)
    parsed_chunks.join
  end

  def self.parse(chunks)
    chunks.map do |chunk|
      formatted_chunk = StrongRenderer.render(chunk)
      emphasized_chunk = EmphasisRenderer.render(formatted_chunk)

      if chunk.start_with?("#")
        HeaderRenderer.render(emphasized_chunk)
      else
        ParagraphRenderer.render(emphasized_chunk)
      end
    end
  end
end

