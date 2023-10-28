
def num_of_people_in_group(people_num, group_num)
  min_num = 2 #最小の人数
  max_num = people_num - (group_num - 1)*min_num
  new_nums = []

  new_nums << rand(min_num..max_num) #最小値と最大値の間でランダムな数をとる
  left_num = people_num - new_nums[0] #残りの人数

  if group_num - 1 == 1
    new_nums << left_num
  else
    #残った人数で残りのグループを分ける
    new_nums.concat(num_of_people_in_group(left_num,group_num - 1))
  end

  return new_nums
end

def separete_group(group_num_array,all_people_array)
  new_groups = []
  group_num_array.map do |num|
    new_groups << all_people_array.sample(num).sort
    all_people_array = all_people_array - new_groups[-1]
  end
  return new_groups
end

peoples = ['A','B','C','D','E','F']

g_nums = num_of_people_in_group(peoples.length,2)
separete_group(g_nums,peoples).map do |group|
  p(group)
end
