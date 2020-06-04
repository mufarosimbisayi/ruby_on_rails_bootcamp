def declare_hashes()
  states = {
    "Oregon" => "OR",
    "Alabama" => "AL",
    "New Jersey" => "NJ",
    "Colorado" => "CO"
  }
  capitals = {
    "OR" => "Salem",
    "AL" => "Montgomery",
    "NJ" => "Trenton",
    "CO" => "Denver"
  }
  return states, capitals
end

def invert_hash(hash)
  hash2 = {}
  hash.each do |key, value|
    hash2[value] = key
  end
  hash2
end

def determine_state(city)
  return if ARGV.length != 1
  states, capitals = declare_hashes()
  states = invert_hash(states)
  capitals = invert_hash(capitals)
  abr = capitals[city] || nil
  state = states[abr] || nil
  if state
    puts state
  else
    puts "Unknown state"
  end
end

determine_state(ARGV[0])
