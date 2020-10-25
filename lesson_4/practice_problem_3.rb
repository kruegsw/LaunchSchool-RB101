ages_1 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages_1.reject! { |k, v| v >= 100}

p ages_1

ages_2 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages_2.select! { |k, v| v < 100}

p ages_2

ages_3 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages_3.keep_if { |_,v| v < 100 }

p ages_3
