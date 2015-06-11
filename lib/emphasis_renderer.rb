class EmphasisRenderer
  def self.render(markdown)
    # markdown.gsub(/ \*(\w*)\* /, " <em>\\1</em> ")

    # I want to *empahsize* this and *this* thing.
    emphasized_chunks = markdown.split("*")
    # ["I want to ", "emphasize", " this."]
    # ["I want to ", "emphasize", " this and ", "this", " thing."]

    html_chunks = emphasized_chunks.map.with_index do |chunk, index|
      if index.odd?
        "<em>#{chunk}</em>"
      else
        chunk
      end
    end

    html_chunks.join
  end
end
