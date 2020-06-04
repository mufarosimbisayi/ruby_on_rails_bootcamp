class Html
  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
    head
  end

  def head
    fileHtml = File.new("#{@page_name}.html", "w+")
    fileHtml.puts "<!DOCTYPE html>"
    fileHtml.puts "<html>"
    fileHtml.puts "<head>"
    fileHtml.puts "<title>#{@page_name}</title>"
    fileHtml.puts "</head>"
    fileHtml.puts "<body>"
    fileHtml.close()
  end

  def dump(dump_string)
    open("#{page_name}.html", "a") do |f|
      f.puts "<p>#{dump_string}</p>"
    end
  end

  def finish
    open("#{page_name}.html", "a") do |f|
     f.puts "</body>"
    end
  end
end
