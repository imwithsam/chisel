class EmphasisRenderer
  def self.render(markdown)
    markdown.gsub(/ \*(\w*)\* /, " <em>\\1</em> ")
  end
end
