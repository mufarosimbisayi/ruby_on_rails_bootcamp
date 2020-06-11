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

puts Html.new([Head.new([Title.new("Hello ground!")]), Body.new([H1.new("Oh no, not again!"), Img.new([], {'src':'http://i.imgur.com/pfp3T.jpg'}) ]) ])
