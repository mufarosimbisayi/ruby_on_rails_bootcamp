def declare_arr()
  data = [
    ['Frank', 33],
    ['Stacy', 15],
    ['Juan' , 24],
    ['Dom' , 32],
    ['Steve', 24],
    ['Jill' , 24]
  ]
end

def sort_arr()
  arr = declare_arr()
  arr = arr.sort_by{|x| [x[1], x[0]]}
  arr.each do |x, y|
    puts x
  end
end

sort_arr()
