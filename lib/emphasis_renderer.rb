class EmphasisRenderer
  def self.render(markdown)
    # Old RegEx code
    # markdown.gsub(/ \*(\w*)\* /, " <em>\\1</em> ")

    emphasized_chunks = markdown.split("*")

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
