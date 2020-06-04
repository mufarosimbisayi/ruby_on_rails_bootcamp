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
  states, capitals = declare_hashes()
  states = invert_hash(states)
  capitals = invert_hash(capitals)
  abr = capitals[city] || nil
  state = states[abr] || nil
  "#{city} is the capital of #{state} (akr: #{abr})" if (abr && state)
end

def determine_capital(state)
  states, capitals = declare_hashes()
  abr = states[state] || nil
  city = capitals[abr] || nil
  "#{city} is the capital of #{state} (akr: #{abr})" if (abr && state)
end

def sort_input(argument_string)
  return if ARGV.length != 1
  words = argument_string.split(/\W+/)
  words.each do |word|
    state = determine_state(word.downcase.capitalize)
    city = determine_capital(word.downcase.capitalize)
    puts state if state 
    puts city if city
    puts "#{word} is neither a capital city nor a state" if (state == nil  && city == nil)
  end
end

sort_input(ARGV[0])
