class ParagraphRenderer
  def self.render(markdown)
    "<p>\n  #{markdown.chomp.chomp}\n</p>\n\n"
  end
end

