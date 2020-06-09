class Elem
  attr_reader :tag, :content, :tag_type, :opt, :html_array

  def initialize(name, content=false, type="double", opt=false)
    @tag = name
    @content = content if content
    @tag_type = type
    @opt = opt if opt
    @html_array = []
  end

  def check_current_content

    unless @content.class == Array
      tmp = @content || nil
      @content = []
      @content[0] = tmp if tmp
    end

  end

  def add_content(*new_content)
    check_current_content

    if new_content.class != Array
      @content.push(new_content)
    elsif new_content.class == Array
      new_content.each do |content_elem|
        @content.push(content_elem)
      end
    end

  end

  def add_simple_tag(elem)
    inline_css = ''
    if elem.opt != nil
      elem.opt.each do |key, value|
        inline_css = inline_css + "#{key}=#{value} "
      end 
      inline_css.rstrip!
    end
    return "<#{elem.tag} #{inline_css}/>"
  end

  def add_double_tag(elem, action="open")
    @html_array.push("<#{elem.tag}>\n") if action == "open"
    @html_array.push("</#{elem.tag}>") if action == "close"
  end

  def html_txt(elem)
    return add_simple_tag(elem) if elem.tag_type == "simple"
    return elem.content if elem.content.class == Text
    add_double_tag(elem, "open")
    html_txt(elem.content.shift) if elem.content.class == Array
    add_double_tag(elem, "close")
  end
    
   # content.each do |elem|
   #   @html_array.push("<#{@tag}>\n#{elem.html_txt}\n</#{@tag}>")
   # end
   # puts html_array.inspect()
   # return html_array
   #end

  def to_s
    html_txt(self)
    puts "#{@html_array.join()}"
  end
end

class Text
  attr_reader :text_string

  def initialize(text_string)
    @text_string = text_string
    self.to_s
  end

  def to_s
   puts  "#{@text_string}"
  end
end
