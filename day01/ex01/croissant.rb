def numbers()
  num = []
  File.foreach("numbers.txt") do |line|
    line.slice!(",")
    num.push(line.to_i)
  end
  num.sort!
  num.each do |element|
    puts element
  end
end

numbers()
