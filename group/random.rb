def separete_group(all_people_array,group_num)
  min_num = 2 #最小の人数
  new_groups = []

  #グループの数だけ繰り返す
  1.upto(group_num) {|n|
  if n != group_num
    max_num = all_people_array.length - (group_num - n)*min_num
    #人数分の要素を抽出して、新しい配列に追加
    new_groups << all_people_array.sample(rand(min_num..max_num)).sort
    #元の配列から、抽出済みの要素を削除する
    all_people_array = all_people_array - new_groups[-1]
  else
    new_groups << all_people_array
  end
  }
  return new_groups
end

def separete_group2

end

peoples = ('A'..'F').to_a
separete_group(peoples,2).map do |group|
  p(group)
end
