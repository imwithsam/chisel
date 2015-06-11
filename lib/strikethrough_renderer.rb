class StrikethroughRenderer
  def self.render(github_markdown)
    # Old RegEx code
    # github_markdown.gsub(/\~{2}(.\w*)\~{2}/, "<del>\\1</del>")

    strikethrough_chunks = github_markdown.split("~~")

    html_chunks = strikethrough_chunks.map.with_index do |chunk, index|
      if index.odd?
        "<del>#{chunk}</del>"
      else
        chunk
      end
    end

    html_chunks.join
  end
end
