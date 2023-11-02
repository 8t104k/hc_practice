pars = gets.split(',').map(&:to_i)
scores = gets.split(',').map(&:to_i)
SCORE_MAPPING = {-4 => 'コンドル',-3 => 'アルバトロス', -2 => 'イーグル', -1 => 'バーディ', 0 => 'パー', 1 => 'ボギー'}

def calc_golf_score(par_num,play_num)
  score = play_num - par_num
  return 'ホールインワン' if par_num < 5 && play_num == 1
  return "#{score}ボギー" if score >= 2
  SCORE_MAPPING[score]
end

score_results = pars.zip(scores).map {|par,play| calc_golf_score(par,play)}
puts score_results.join(',')
