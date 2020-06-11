require_relative 'elem.rb'

class Html < Elem
  def initialize(content=nil, opt=nil)
    @tag = "html"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end
end

class Head < Elem
  def initialize(content=nil, opt=nil)
    @tag = "head"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end
end

class Body < Elem
  def initialize(content=nil, opt=nil)
    @tag = "body"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end
end

class Title < Elem
  def initialize(text_string)
    @tag = "title"
    @tag_type = "double"
    @opt = opt || {}
    @content = Text.new(text_string.dump)
  end
end

class Img < Elem
  def initialize(content=nil, opt=nil)
    @tag = "img"
    @tag_type = "simple"
    @opt = opt || {}
    @content = content || []
  end
end

class H1 < Elem
  def initialize(text_string)
    @tag = "h1"
    @tag_type = "double"
    @opt = opt || {}
    @content = Text.new(text_string.dump)
  end
end

class Meta < Elem
  def initialize(content=nil, opt=nil)
    @tag = "meta"
    @tag_type = "simple"
    @opt = opt || {}
    @content = content || []
  end

  def  add_meta(html_string=nil)
    inline_css = ''
    return "<meta #{inline_css}>" if html_string == nil
    if @opt != nil
      @opt.each do |key, value|
        inline_css = inline_css + "#{key}='#{value}' "
      end
    end

    if i = html_string.index("<head>") + 7
      return html_string.insert(i , "<meta #{inline_css}>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "meta"
      return add_meta(html_string)
    else
      return nil
    end
  end
end

class Table < Elem
  def initialize(content=nil, opt=nil)
    @tag = "table"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_table(html_string=nil)
    return "<table>\n</table>" if html_string == nil
    if i = html_string.index("</body>")
      return html_string.insert(i, "<table>\n</table>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "table"
      return add_table(html_string)
    else
      return nil
    end
  end
end

class Th < Elem
  def initialize(content=nil, opt=nil)
    @tag = "th"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_th(html_string=nil)
    return "<th>\n</th>" if html_string == nil
    if i = html_string.index("</tr>")
      return html_string.insert(i, "<th>\n</the>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "th"
      return add_th(html_string)
    else
      return nil
    end
  end
end

class Tr < Elem
  def initialize(content=nil, opt=nil)
    @tag = "tr"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_tr(html_string=nil)
    return "<tr>\n</tr>" if html_string == nil
    if i = html_string.index("</table>")
      return html_string.insert(i, "<tr>\n</tr>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "tr"
      return add_tr(html_string)
    else
      return nil
    end
  end
end

class Td < Elem
  def initialize(content=nil, opt=nil)
    @tag = "td"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_td(html_string=nil)
    return "<td>\n</td>" if html_string == nil
    if i = html_string.index("</tr>")
      return html_string.insert(i, "<td>\n</td>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "td"
      return add_td(html_string)
    else
      return nil
    end
  end
end

class Ul < Elem
  def initialize(content=nil, opt=nil)
    @tag = "ul"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_ul(html_string=nil)
    return "<ul>\n</ul>" if html_string == nil
    if i = html_string.index("</body>")
      return html_string.insert(i, "<ul>\n</ul>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "ul"
      return add_ul(html_string)
    else
      return nil
    end
  end
end

class Ol < Elem
  def initialize(content=nil, opt=nil)
    @tag = "ol"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_ol(html_string=nil)
    return "<ol>\n</ol>" if html_string == nil
    if i = html_string.index("</body>")
      return html_string.insert(i, "<ol>\n</ol>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "ol"
      return add_ul(html_string)
    else
      return nil
    end
  end
end

class Li < Elem
  def initialize(content=nil, opt=nil)
    @tag = "li"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_li(html_string=nil)
    return "<li>\n</li>" if html_string == nil
    if i = html_string.index("</ul>") || html_string.index("</ol>")
      return html_string.insert(i, "<li>\n</li>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "li"
      return add_li(html_string)
    else
      return nil
    end
  end
end

class H2 < Elem
  def initialize(content=nil, opt=nil)
    @tag = "h2"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_h2(html_string=nil, inner_string)
    return "<h2>#{inner_string}</h2>" if html_string == nil
    if i = html_string.index("</body>")
      return html_string.insert(i, "<h2>#{inner_string}</h2>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "h2"
      return add_h2(html_string, @content.text)
    else
      return nil
    end
  end
end

class P < Elem
  def initialize(content=nil, opt=nil)
    @tag = "p"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_p(html_string=nil, inner_string)
    return "<p>#{inner_string}</p>" if html_string == nil
    if i = html_string.index("</body>")
      return html_string.insert(i, "<p>#{inner_string}</p>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "p"
      return add_p(html_string, @content.text)
    else
      return nil
    end
  end
end

class Div < Elem
  def initialize(content=nil, opt=nil)
    @tag = "div"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_div(html_string=nil, inner_string)
    return "<div>#{inner_string}</div>" if html_string == nil
    if i = html_string.index("</body>")
      return html_string.insert(i, "<div>#{inner_string}</div>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "div"
      return add_div(html_string, @content.text)
    else
      return nil
    end
  end
end

class Span < Elem
  def initialize(content=nil, opt=nil)
    @tag = "span"
    @tag_type = "double"
    @opt = opt || {}
    @content = content || []
  end

  def add_span(html_string=nil)
    return "<span>#{inner_string}</span>" if html_string == nil
    if i = html_string.index("</div>")
      return html_string.insert(i, "<span>#{inner_string}</span>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "span"
      return add_span(html_string, @content.text)
    else
      return nil
    end
  end
end

class Hr < Elem
  def initialize(content=nil, opt=nil)
    @tag = "hr"
    @tag_type = "simple"
    @opt = opt || {}
    @content = content || []
  end

  def add_hr(html_string=nil)
    return "<hr>\n" if html_string == nil
    if i = html_string.index("</body>")
      return html_string.insert(i, "<hr>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "hr"
      return add_hr(html_string)
    else
      return nil
    end
  end
end

class Br < Elem
  def initialize(content=nil, opt=nil)
    @tag = "br"
    @tag_type = "simple"
    @opt = opt || {}
    @content = content || []
  end

  def add_br(html_string=nil)
    return "</br>\n" if html_string == nil
    if i = html_string.index("</p>")
      return html_string.insert(i, "</br>\n")
    end
    return html_string
  end

  def create_html_string(html_string=nil)
    case @tag
    when "br"
      return add_br(html_string)
    else
      return nil
    end
  end
end

puts Head.new([Meta.new([], {'src':'http://i.imgur.com/pfp3T.jpg'}) ])
