
def num_of_people_in_group(all_people_num)
  key = rand(2..all_people_num-2)
  return [key,all_people_num - key]
end

def separete_group(group_num_array,all_people_array)
  g1_num,g2_num = group_num_array
  g1 = []
  g2 = []

  g1 = all_people_array.sample(g1_num)
  p(g1.sort)
  g2 = all_people_array - g1
  p(g2)

end

peoples = ['A','B','C','D','E','F']

g_nums = num_of_people_in_group(peoples.length)
separete_group(g_nums,peoples)
