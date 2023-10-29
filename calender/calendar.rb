require 'Date'
require 'optparse'

opt = OptionParser.new

opt.on('-m') {|v| p v }
argv = opt.parse(ARGV)
p(argv)

#引数のバリデーション
if argv == []
  m = Date.today.strftime('%m').to_i
else
  return true if argv[0].to_i > 12
  m = argv[0].to_i
end

s_date = Date.new(2023,m,1)
e_date = Date.new(2023,m,-1)
month = "    #{s_date.strftime('%B')} #{s_date.strftime('%Y')}"
weeks = 'Mo Tu We Th Fr Sa Su '
days = (1..e_date.strftime("%e").to_i).to_a
#p(s_date.strftime("%a"))
#p(((s_date.wday.to_i)+6)%7)
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
