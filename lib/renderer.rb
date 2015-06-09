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
      emphasized_chunk = EmphasisRenderer.render(chunk)
      formatted_chunk = StrongRenderer.render(emphasized_chunk)

      if chunk.match(/^\#{1,6}\s?/) != nil
        HeaderRenderer.render(formatted_chunk)
      else
        ParagraphRenderer.render(formatted_chunk)
      end
    end
  end

  # def self.parse_headers(chunks)
  #   chunks.map do |chunk|
  #     if chunk.match(/^\#{1,6}\s?/) != nil
  #       HeaderRenderer.render(chunk)
  #     else
  #       ParagraphRenderer.render(chunk)
  #     end
  #   end
  # end
end

