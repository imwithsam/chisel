class ParagraphRenderer
  def self.render(markdown)
    "<p>#{markdown.chomp.chomp}</p>\n\n"
  end
end

