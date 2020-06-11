class Elem
  attr_reader :tag, :content, :tag_type, :opt, :html_array

  def initialize(name, content=nil, type="double", opt=nil)
    @tag = name
    @tag_type = type
    @opt = opt || {}
    @content = content || []
  end

  def add_content(*new_content)
    if new_content.class != Array
      @content.push(new_content)
    elsif new_content.class == Array
      new_content.each do |content_elem|
        @content.push(content_elem)
      end
    end
  end

  def add_html
    "<html>\n</html>"
  end

  def add_head(html_string=nil)
    return "<head>\n</head>" if html_string == nil
    if i = html_string.index("</html>")
      return html_string.insert(i, "<head>\n</head>\n")
    end
    return html_string
  end

  def add_title(html_string=nil, title_string)
    return "<title>#{title_string}</title>" if html_string == nil
    if i = html_string.index("</head>")
      return html_string.insert(i, "<title>#{title_string}</title>\n")
    end
    return html_string
  end

  def add_body(html_string=nil)
    return "<body>\n</body>" if html_string == nil
    if i = html_string.index("</html>")
      return html_string.insert(i, "<body>\n</body>\n")
    end
    return html_string
  end

  def add_h1(html_string=nil, inner_string)
    return "<h1>#{inner_string}</h1>" if html_string == nil
    if i = html_string.index("</body>")
      return html_string.insert(i, "<h1>#{inner_string}</h1>\n")
    end
    return html_string
  end

  def  add_img(html_string=nil)
    inline_css = ''
    return "<img #{inline_css}/>" if html_string == nil
    if @opt != nil
      @opt.each do |key, value|
        inline_css = inline_css + "#{key}='#{value}' "
      end 
    end

    if i = html_string.index("</body>")
      return html_string.insert(i , "<img #{inline_css}/>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
      when "html"
        return add_html
      when "head"
        return add_head(html_string)
      when "title"
        return add_title(html_string, @content.text)
      when "body"
        return add_body(html_string)
      when "h1"
        return add_h1(html_string, @content.text)
      when "img"
        return add_img(html_string)
      else
        return nil
      end
  end

  def try_loop(elem, html_string)
    html_string = elem.create_html_string(html_string)
    return html_string if elem.content.class != Array
    elem.content.each do |element|
      html_string = try_loop(element, html_string)
    end
    return html_string
  end

  def to_s
    html_string = create_html_string()
    if @content.class == Array
      @content.each do |elem|
         html_string = try_loop(elem, html_string)
      end
    end
    return "#{html_string}"
  end
end

class Text
  attr_reader :text

  def initialize(text_string)
    @text = text_string
  end
end
