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

def determine_capital(state)
  return if ARGV.length != 1
  states, capitals = declare_hashes()
  abr = states[state] || nil
  city = capitals[abr] || nil
  if city
    puts city
  else
    puts "Unknown state"
  end
end

determine_capital(ARGV[0])
