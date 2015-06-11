require 'pry'
require './lib/chunker'
require './lib/emphasis_renderer'
require './lib/strong_renderer'
require './lib/unordered_list_renderer'
require './lib/ordered_list_renderer'
require './lib/header_renderer'
require './lib/paragraph_renderer'

class Renderer
  def self.render(markdown)
    chunks = Chunker.chunk(markdown)
    parsed_chunks = self.parse(chunks)
    parsed_chunks.join
  end

  def self.parse(chunks)
    chunks.map do |chunk|
      # TODO: Find a better ways to handle edge cases

      if chunk.start_with?("*")
        chunk = UnorderedListRenderer.render(chunk)
      elsif chunk.start_with?("1.")
        chunk = OrderedListRenderer.render(chunk)
      end

      strong_symbol_count = chunk.count("**")
      if strong_symbol_count > 0 && strong_symbol_count.even?
        chunk = StrongRenderer.render(chunk)
      end

      emphasize_symbol_count = chunk.count("*")
      if emphasize_symbol_count > 0 && emphasize_symbol_count.even?
        chunk = EmphasisRenderer.render(chunk)
      end

      if chunk.start_with?("#")
        chunk = HeaderRenderer.render(chunk)
      elsif !chunk.start_with?("<ul>") && !chunk.start_with?("<ol>")
        chunk = ParagraphRenderer.render(chunk)
      end

      chunk
    end
  end
end

