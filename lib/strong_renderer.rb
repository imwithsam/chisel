class StrongRenderer
  def self.render(markdown)
    markdown.gsub(/ \*{2}(\w*)\*{2} /, " <strong>\\1</strong> ")
  end
end