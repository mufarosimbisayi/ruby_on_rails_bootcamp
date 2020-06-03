def create_array()
  [['Caleb' , 24],
  ['Calixte' , 84],
  ['Calliste', 65],
  ['Calvin' , 12],
  ['Cameron' , 54],
  ['Camil' , 32],
  ['Camille' , 5],
  ['Can' , 52],
  ['Caner' , 56],
  ['Cantin' , 4],
  ['Carl' , 1],
  ['Carlito' , 23],
  ['Carlo' , 19],
  ['Carlos' , 26],
  ['Carter' , 54],
  ['Casey' , 2]]
end

def convert_to_hash()
  array = create_array()
  hash = {}
  array.each do |value, key|
    hash[key] = value
  end
  hash.each do |key, value|
    puts "#{key} : #{value}"
  end
end

convert_to_hash()
