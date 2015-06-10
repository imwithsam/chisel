class StrongRenderer
  def self.render(markdown)
    # markdown.gsub(/ \*{2}(\w*)\*{2} /, " <strong>\\1</strong> ")

    strong_chunks = markdown.split("**")
    html_chunks = strong_chunks.map.with_index do |chunk, index|
      if index.odd?
        "<strong>#{chunk}</strong>"
      else
        chunk
      end
    end

    html_chunks.join
  end
end
