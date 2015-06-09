class StrikethroughRenderer
  def self.render(github_markdown)
    #TODO: handle strikethrough with punctuation
    github_markdown.gsub(/\~{2}(.\w*)\~{2}/, "<del>\\1</del>")
  end
end