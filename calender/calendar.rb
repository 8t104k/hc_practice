require 'Date'

s_date = Date.new(2023,10,1)
e_date = Date.new(2023,10,-1)
month = "    #{s_date.strftime('%B')} #{s_date.strftime('%Y')}"
days_arry = [
  ['Mo','Tu','We','Th','Fr','Sa','Su'],
  (1..31).to_a
  ]

printf(month)
print("\n")
days_arry.map do |i|
  i.map { |l| print(l.to_s + " ") }
  print("\n")
end
