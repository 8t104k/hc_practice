pars = gets.split(',').map(&:to_i)
scores = gets.split(',').map(&:to_i)

def output_score(par_num,play_num)
  score = play_num - par_num
  return 'ホールインワン' if par_num < 5 && play_num == 1
  return "#{score}ボギー" if score >=2
  case score
  when 1
    'ボギー'
  when 0
    'パー'
  when -1
    'バーディ'
  when -2
    'イーグル'
  when -3
    'アルバトロス'
  when -4
    'コンドル'
  end
end

score_results = []
#pars.map.with_index do |par, index|
#  score_results << output_score(par,scores[index])
#end

pars.zip(scores).map do |par,play|
  score_results << output_score(par,play)
end
puts score_results.join(',')
