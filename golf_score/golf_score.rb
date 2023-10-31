hash_value = Hash.new
hash_key = [:par,:play]
#lines = [[4,4,5,3,5,4,4,3,4,4,5,4,4,3,4,4,3,5],[2,3,1,5,8,3,5,1,5,6,2,5,7,2,5,5,2,6]]


lines = readlines(chomp: true).map{|line| line.split(',').map(&:to_i)}
#lines = std_in.map{|line| line.split(',').map(&:to_i)}
#lines = readlines(chomp: true).map.with_index{|line,i| lines.store(hash_value[i],line.split(',').map(&:to_i))}
#lines = readlines(chomp: true).map.with_index{|line,i| lines.store(hash_value[i],line)}
#ary = [hash_key,lines].transpose
#h = Hash[*ary]
#h = [hash_key,lines].transpose.to_h
pars = lines[0]
scores = lines[1]

def output_score(par_num,play_num)
  score = play_num - par_num
  return 'ホールインワン' if par_num < 5 && play_num == 1
  return "#{score}ボギー" if score >=2
  case score
  when 1
    return 'ボギー'
  when 0
    return 'パー'
  when -1
    return 'バーディ'
  when -2
    return 'イーグル'
  when -3
    return 'アルバトロス'
  when -4
    return 'コンドル'
  end
end

arry = []
pars.map.with_index do |par, index|
  arry << output_score(par,scores[index])
end
print(arry.join(','))
