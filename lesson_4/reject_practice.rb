flavors = ['chocolate', 'strawberry', 'mint', 'vanilla']
flavors_2 = flavors.reject { |flavor| puts flavor }

puts flavors.object_id
puts flavors_2.object_id