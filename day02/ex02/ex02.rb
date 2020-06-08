class Dup_file < StandardError
  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
  end

  def show_state
    begin
      raise if Dir["#{Dir.pwd}/#{@page_name}.*html"].size > 0
    rescue
      Dir["#{Dir.pwd}/#{@page_name}.*.html"].each do |file_path|
        puts "A file named #{File.basename(file_path)} was already there: #{file_path}"
      end
      return true
    end
    false
  end

  def correct
    new_file = @page_name
    page_name_length = @page_name.size
    Dir["#{Dir.pwd}/#{@page_name}.*html"].each do |path|
      new_file.insert(page_name_length, ".new")
    end
    new_file
  end

  def explain
    puts "Appended .new in order to create requested file: #{Dir.pwd}/#{page_name}.html"
  end
end

class Body_closed < StandardError
  attr_reader :page_name

  def initialize(page_name)
    @page_name = page_name
  end

  def show_state
    begin
      raise if File.readlines("#{page_name}.html").grep(/\<\/body\>/).size > 0
    rescue
      puts "In #{page_name}.html body was closed."
    end
  end

  def closing_body_line
    line_counter = 0
    File.open("#{Dir.pwd}/#{page_name}.html") do |f|
      f.readlines.each do |line|
        return line_counter, line if line.include?("</body>")
        line_counter += 1
      end
    end
    nil
  end

  def closing_body_position(line)
    body_size = "</body>".length
    (0..line.size-body_size).each { |i| return i if line[i,body_size] == "</body>" }
  end

  def explain(line_counter)
    puts "  > ln :#{line_counter} </body> : text has been inserted and tag moved at the end of it."
  end

  def correct(new_string)
    line_counter, line = closing_body_line
    if line != nil
      body_index = closing_body_position(line)
      lines = File.readlines("#{page_name}.html")
      return true if new_string == "</body>" && (lines[line_counter].include? "</body>")
      lines[line_counter].insert(body_index, new_string + "\n")
      File.open("#{page_name}.html", 'w') { |f| f.write(lines.join) }
      explain(line_counter + 1)
      return true
    end
    false
  end

end

class Html
  attr_reader :page_name, :dup_file, :body_closed

  def initialize(page_name)
    @page_name = page_name
    @dup_file = Dup_file.new(page_name)
    @body_closed = Body_closed.new(page_name)
    head
  end

  def head
    if @dup_file.show_state
      @page_name = @dup_file.correct
      @dup_file.explain
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

    body_closed.show_state
    return if body_closed.correct("<p>#{dump_string}</p>")


    open("#{page_name}.html", "a") do |f|
      f.puts "<p>#{dump_string}</p>"
    end
  end

  def finish
    body_closed.show_state
    return if body_closed.correct("</body>")
    open("#{page_name}.html", "a") do |f|
     f.puts "</body>"
    end
  end
end

def test_method()
	a = Html.new("test")
	10.times{|x| a.dump("some_number#{x}")}
	a.finish
	1.times{|x| a.dump("some_number#{x}")}
end

test_method()
