class Html
  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
    head
  end

  def head
    begin
      raise if File.exists? "#{page_name}.html"
    rescue
      abort "A file named #{@page_name} already exist!"
    end

    fileHtml = File.new("#{@page_name}.html", "w+")
    fileHtml.puts "<!DOCTYPE html>"
    fileHtml.puts "<html>"
    fileHtml.puts "<head>"
    fileHtml.puts "<title>#{page_name}</title>"
    fileHtml.puts "</head>"
    fileHtml.puts "<body>"
    fileHtml.close()
  end

  def dump(dump_string)
    begin
      raise if File.readlines("#{page_name}.html").grep(/\<body\>/).size == 0
    rescue 
      abort "There is no body tag in #{page_name}"
    end

    begin
      raise if File.readlines("#{page_name}.html").grep(/\<\/body\>/).size > 0
    rescue
      abort "Body has already been closed in #{page_name}"
    end

    open("#{page_name}.html", "a") do |f|
      f.puts "<p>#{dump_string}</p>"
    end
  end

  def finish
    begin
      raise if File.readlines("#{page_name}.html").grep(/\<\/body\>/).size > 0
    rescue
      abort "#{page_name} has already been closed."
    end

    open("#{page_name}.html", "a") do |f|
     f.puts "</body>"
    end
  end
end

def test_method()
	a = Html.new("test")
	10.times{|x| a.dump("some_number#{x}")}
	a.finish
end

test_method()
