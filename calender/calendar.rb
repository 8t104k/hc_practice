require 'Date'
require 'optparse'

params = ARGV.getopts("m:")
if params['m'] == nil
  m = Date.today.strftime('%m').to_i
else
  m = params['m'].to_i
end

if m >= 1 && m <= 12
  s_date = Date.new(2023,m,1)
  e_date = Date.new(2023,m,-1)
else
  raise "#{m} is neither a month number (1..12) nor a name"
end

month = "    #{s_date.strftime('%B')} #{s_date.strftime('%Y')}"
weeks = 'Mo Tu We Th Fr Sa Su '
days = (1..e_date.strftime("%e").to_i).to_a

#からの配列ぶち込む
days = Array.new(((s_date.wday.to_i)+6)%7,'') + days

puts(month + "\n")
puts(weeks + "\n")
days.each.with_index(1) { |day,i|
printf("%3s",day.to_s + " ")
if i%7 == 0
  print("\n")
end
}
print("\n")
