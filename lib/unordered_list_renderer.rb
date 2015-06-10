class UnorderedListRenderer
  def self.render(markdown)
    list_items = self.chunk(markdown).map do |list_item|
      # list_item.gsub(/^\*\s?(.*)/, "  <li>\\1</li>\n")
      
      list_item.sub("* ", "  <li>") + "</li>\n"
    end

    "<ul>\n" + list_items.join + "</ul>\n"
  end

  def self.chunk(markdown)
    markdown.split("\n")
  end
end

