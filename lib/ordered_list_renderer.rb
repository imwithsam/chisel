class OrderedListRenderer
  def self.render(markdown)
    # Old RegEx code
    # list_item.gsub(/^\d.\s?(.*)/, "  <li>\\1</li>\n")

    list_items = self.chunk(markdown).map do |list_item|
      index = list_item.index(".")
      list_item.sub(list_item[0..(index + 1)], "  <li>") + "</li>\n"
    end

    "<ol>\n" + list_items.join + "</ol>\n\n"
  end

  def self.chunk(markdown)
    markdown.split("\n")
  end
end

