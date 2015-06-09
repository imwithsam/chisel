class HeaderRenderer
  def self.render(markdown)
    header_count = markdown.match(/^\#{1,6}\s?/)[0].count("#")
    markdown.sub(/^\#{1,6}\s?/, "<h#{header_count}>") + "</h#{header_count}>\n\n"
  end
end

