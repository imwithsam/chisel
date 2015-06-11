class ParagraphRenderer
  def self.render(markdown)
    # TODO: Make it work with different numbers of \n characters
    # markdown.count("\n")
    "<p>#{markdown.chomp.chomp}</p>\n\n"
  end
end

