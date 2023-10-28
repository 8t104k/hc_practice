
def num_of_people_in_group(people_num, group_num)
  min_num = 2 #最小の人数
  max_num = people_num - (group_num - 1)*min_num
  new_nums = []

  new_nums << rand(min_num..max_num) #最小値と最大値の間でランダムな数をとる
  left_num = people_num - new_nums[0] #残りの人数

  if group_num - 1 == 1
    #残りが一つのグループならば、残りの人数を全て割り当てる
    new_nums << left_num
  else
    #残った人数でさらにグループを分ける
    new_nums.concat(num_of_people_in_group(left_num,group_num - 1))
  end

  return new_nums
end

def separete_group(group_num_array,all_people_array)
  new_groups = []
  group_num_array.map do |num|
    #人数分の要素を抽出して、新しい配列に追加
    new_groups << all_people_array.sample(num).sort
    #元の配列から、抽出済みの要素を削除する
    all_people_array = all_people_array - new_groups[-1]
  end
  return new_groups
end

peoples = ('A'..'F').to_a

g_nums = num_of_people_in_group(peoples.length,2)
separete_group(g_nums,peoples).map do |group|
  p(group)
end
