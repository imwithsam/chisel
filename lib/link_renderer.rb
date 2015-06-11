class LinkRenderer
  def self.render(markdown)

    single_link_fragments = link_fragments_from(markdown)

    rendered_fragments = single_link_fragments.map do |fragment|
      render_link(fragment)
    end

    rendered_fragments.join("")
  end

  def self.link_fragments_from(markdown)
    parts = markdown.split(")")
    if parts.count == 1
      parts.map{|f| f + ")"}
    else
      parts[0..-2].map{|f| f + ")"}.push(parts[-1])
    end
  end

  def self.has_link?(markdown)
    markdown.index('[') && markdown.index(']') && markdown.index('(') && markdown.index(')')
  end

  def self.render_link(markdown)
    if has_link?(markdown)
      # extract url within ()
      url = url_from(markdown)

      # extract text from []
      text = text_from(markdown)

      # build start of href <a href='url'>
      "#{pretext_from(markdown)}<a href='#{url}'>#{text}</a>#{posttext_from(markdown)}"
    else
      markdown
    end
  end

  def self.pretext_from(markdown)
    if markdown[0] != "["
      markdown[0..(markdown.index("[") - 1)]
    else
      ""
    end
  end

  def self.posttext_from(markdown)
    url_end = markdown.index(")") + 1
    markdown[url_end..-1]
  end

  def self.url_from(markdown)
    url_start = markdown.index("(") + 1
    url_end = markdown.index(")") - 1
    markdown[url_start..url_end]
  end

  def self.text_from(markdown)
    text_start = markdown.index("[") + 1
    text_end = markdown.index("]") - 1
    markdown[text_start..text_end]
  end
end

