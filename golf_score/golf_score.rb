pars = gets.split(',').map(&:to_i)
scores = gets.split(',').map(&:to_i)

def calc_golf_score(par_num,play_num)
  score = play_num - par_num
  return 'ホールインワン' if par_num < 5 && play_num == 1
  return "#{score}ボギー" if score >= 2
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

score_results = pars.zip(scores).map {|par,play| calc_golf_score(par,play)}
puts score_results.join(',')
