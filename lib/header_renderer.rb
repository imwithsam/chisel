class HeaderRenderer
  def self.render(markdown)
    # Old RegEx Code
    # header_count = markdown.match(/^\#{1,6}\s?/)[0].count("#")
    # markdown.sub(/^\#{1,6}\s?/, "<h#{header_count}>") + "</h#{header_count}>\n\n"

    header_markdown = header_markdown(markdown)
    header_level = header_level(markdown)

    html = markdown.sub(header_markdown, "<h#{header_level}>")
    html += "</h#{header_level}>\n\n"

    html
  end

  def self.header_level(markdown)
    header_level = 0
    markdown.each_char do |char|
      if char == "#"
        header_level += 1
      else
        break
      end
    end

    header_level
  end

  def self.header_markdown(markdown)
    header_markdown = ""
    markdown.each_char do |char|
      if char == "#"
        header_markdown += "#"
      else
        header_markdown += " "
        break
      end
    end

    header_markdown
  end
end

