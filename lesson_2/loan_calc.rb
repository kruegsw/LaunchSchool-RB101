

print ">> What is the load amount?  "
loan_amount = gets.chomp.to_i

print ">> What is the loan duration (in months)?  "
periods = gets.chomp.to_i

print ">> what is the interest rate (in percent, e.g. enter 5 for 5%)  "
interest = gets.chomp.to_f / 100 / 12


payment = loan_amount * (interest / (1 - (1 + interest)**(-periods)))

puts ">> Your monthly payment will be #{payment} for #{format('%.2f', periods)} months to pay off #{loan_amount}"