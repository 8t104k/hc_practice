require 'Date'

s_date = Date.new(2023,10,1)
e_date = Date.new(2023,10,-1)
month = "    #{s_date.strftime('%B')} #{s_date.strftime('%Y')}"
days_arry = [
  ['Su','Mo','Tu','We','Th','Fr','Sa'],
  (1..31).to_a
  ]

printf(month)
days_arry.map do |i|
  print(i)
end
