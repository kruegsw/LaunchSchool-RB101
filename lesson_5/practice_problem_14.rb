hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each do |_, details|
  arr << details[:size].upcase if details[:type] == 'vegetable'
  arr << details[:colors].map { |word| word.capitalize } if details[:type] == 'fruit'
end

arr


arr2 = hsh.map do |_, details|
  if details[:type] == 'vegetable'
    details[:size].upcase
  elsif details[:type] == 'fruit'
    details[:colors].map { |color| color.capitalize }
  end
end

p arr2