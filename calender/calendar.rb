require 'Date'

s_date = Date.new(2023,11,1)
e_date = Date.new(2023,11,-1)
month = "    #{s_date.strftime('%B')} #{s_date.strftime('%Y')}"
weeks = 'Mo Tu We Th Fr Sa Su '
days = (1..31).to_a
p(s_date.strftime("%a"))
p(((s_date.wday.to_i)+6)%7)
#からの配列ぶち込む
days = Array.new(((s_date.wday.to_i)+6)%7,'') + days

printf(month)
print("\n")
printf(weeks)
print("\n")

days.each.with_index(1) { |day,i|
printf("%3s",day.to_s + " ")
if i%7 == 0
  print("\n")
end
}
print("\n")
