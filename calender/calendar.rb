require 'Date'
require 'optparse'

params = ARGV.getopts("m:")

if params['m'] == nil
  #引数がなければ時効した日付の月を取得する
  arg_m = Date.today.strftime('%m').to_i
elsif params['m'] >= 1 && params['m'] <= 12
  arg_m = params['m'].to_i
elsif params['m'] < 1 || params['m'] > 12
  #1以下または12以上の場合はエラーを返す
  raise "#{arg_m} is neither a month number (1..12) nor a name"
else
  #それ以外の文字列はエラーを出す
  raise "#{arg_m} is not a suitable argument"
end

s_date = Date.new(2023,arg_m,1)
e_date = Date.new(2023,arg_m,-1)
month = "    #{s_date.strftime('%B')} #{s_date.strftime('%Y')}"
weeks = 'Mo Tu We Th Fr Sa Su '
days = (1..e_date.strftime("%e").to_i).to_a

#配列daysに、1日の開始曜日分、空の配列ぶち込む
days = Array.new(((s_date.wday.to_i)+6)%7,'') + days

#カレンダーの表示
puts(month + "\n")
puts(weeks + "\n")
days.each.with_index(1) { |day,i|
printf("%3s",day.to_s + " ")
if i%7 == 0
  print("\n")
end
}
