pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def nyc_pigeon_organizer(data)
  new_hash = {}
  name_array_all = []

#adding all names to an array
  data.each do |key, value|
    value.each do |key2, value2|
      name_array_all << value2
    end
  end

#finding unique names and creating first layer of new_hash
  name_final = name_array_all.flatten.uniq
  name_final.each do |name|
    new_hash[name] = {color:[], gender: [], lives: []}
  end

#adding seccond layer to new_hash
data.each do |key, value|
  value.each do |key2, value_arr|
    value_arr.each do |name|
      new_hash[name][key] << key2.to_s
    end
  end
end

#returns the whole hash
new_hash
end


#alternative -- notes from group meeting
  #build a scaffold hash that will be shoved into names
  #create hash with names
  #assign each name its scaffold hash
    #fill scaffold hash

#alternative -- notes from lecture
  # A. Problem Sovling
    # rephrase the problem
    # think about how we solve this problem without code
      # use an analogy OR how this would work in real life

  # B. Translating this into code
    # REJECT information - just to get to core
    # Coerce - think about hte data structure that we want

  # General Techniques
    # making the problem less abstract
      # puts, binding
      # write a comment of the data return value
    # get a feedback loop
    # really understanding the data structure 

def nyc_pigeon_organizer_two(data)
# MAP will return a changed value, EACH will return original

  # coerce each name as the key in the hash
  #access all names
  #names - ['']
    # unique list of names
  names = data.values[0].values.flatten.uniq

    # use name as key in hash - fill in with scaffold hash
  initial_structure = names.each_with_object ({}) do |name, hash|
    hash[name] = {color: [], gender: [], lives:[]}
  end

  names.each_with_object(initial_structure) do |pigeon, my_initial_structure|
    attributes = data.keys
    attributes.each do |attribute|
      data[attribute].each do |value, names|
        if names.include?(pigeon)
          my_initial_structure[pigeon][attribute] << value.to_s
        end
      end
    end
  end


end
