arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hsh = {}
arr.each { |k, v, c| hsh[k] = v; p c }

p hsh
p "{:a=>1, 'b'=>'two', 'sea'=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>'D'}"