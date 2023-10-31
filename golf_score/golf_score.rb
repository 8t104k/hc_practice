pars = gets.split(',').map(&:to_i)
scores = gets.split(',').map(&:to_i)

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
