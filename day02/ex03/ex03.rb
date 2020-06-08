class Elem
  attr_reader :tag, :content, :tag_type, :opt

  def initialize(name, content=false, type=false, opt=false)
    @tag = name
    @content = content if content
    @type = type if type
    @opt = opt if opt
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

  def add_tag
    
    if @tag_type == simple || @opt != nil
      
    end
    return "<#{tag} #{inline_css}/>"
  end

  def to_s
    html_text = ''
    
  end
end

class Text
  def initialize(text_string)
    puts text_string
  end
end
