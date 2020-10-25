munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |person, attributes|
  case attributes["age"]
  when 0...18 
    attributes["age_group"] = "kid"
  when (64...)
    attributes["age_group"] = "senior"
  else
    attributes["age_group"] = "adult"
  end
end

p munsters