def parse
empty_hash = {}
array_hash = [{"user_name" => "jon", "text" => "sucks", "something" => "else"}, {"user_name" => "andrew", "text" => "awesome"}, {"user_name" => "juna", "text" => "love"}]
  length_of_array = array_hash.length
  index = 0
  while length_of_array > 0
    u = array_hash[index]["user_name"]
    t = array_hash[index]["text"]
    length_of_array = length_of_array - 1
    index = index + 1
    empty_hash[u] = t
  end
  puts empty_hash
end

parse