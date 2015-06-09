require_relative 'chunker'
require_relative 'header_renderer'
require_relative 'paragraph_renderer'

class Renderer
  def self.render(markdown)
    chunks = Chunker.chunk(markdown)
    parsed_chunks = self.parse_headers(chunks)
    parsed_chunks.join
  end

  def self.parse_headers(chunks)
    chunks.map do |chunk|
      if chunk.match(/^\#{1,6}\s?/) != nil
        HeaderRenderer.render(chunk)
      else
        ParagraphRenderer.render(chunk)
      end
    end
  end
end

