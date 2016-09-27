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
