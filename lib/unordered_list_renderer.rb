class UnorderedListRenderer
  def self.render(markdown)
    # Old RegEx code
    # list_item.gsub(/^\*\s?(.*)/, "  <li>\\1</li>\n")

    list_items = self.chunk(markdown).map do |list_item|
      list_item.sub("* ", "  <li>") + "</li>\n"
    end

    "<ul>\n" + list_items.join + "</ul>\n\n"
  end

  def self.chunk(markdown)
    markdown.split("\n")
  end
end

