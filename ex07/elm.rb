def split_colon(split_arr)
  arr = []
  split_arr.each do |split_string|
    split_string = split_string.split(":")[1]
    split_string.slice!(-1) if split_string.include? "\n"
    arr.push(split_string)
  end
  arr
end

def read_table()
  hash = {}
  array = []
  File.foreach("periodic_table.txt") do |line| 
    line = line.split("=")
    array = split_colon(line[1].split(","))
    hash[line[0]] = array
  end
  hash
end

read_table()
