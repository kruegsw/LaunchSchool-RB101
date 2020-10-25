munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

p munsters.object_id
p munsters["Herman"]["age"].object_id

def mess_with_demographics(demo_hash)
  p demo_hash.object_id
  temp_hash = demo_hash.clone
  p temp_hash.object_id
  p temp_hash["Herman"]["age"].object_id

  temp_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
  p temp_hash["Herman"]["age"].object_id
end

p mess_with_demographics(munsters)
p munsters.object_id
p munsters["Herman"]["age"].object_id
