hash_value = Hash.new
hash_key = [:par,:score]
#lines = [[4,4,5,3,5,4,4,3,4,4,5,4,4,3,4,4,3,5],[2,3,1,5,8,3,5,1,5,6,2,5,7,2,5,5,2,6]]

#lines = std_in.map{|line| line.split(',').map(&:to_i)}
lines = readlines(chomp: true).map{|line| line.split(',').map(&:to_i)}
#lines = readlines(chomp: true).map.with_index{|line,i| lines.store(hash_value[i],line.split(',').map(&:to_i))}
#lines = readlines(chomp: true).map.with_index{|line,i| lines.store(hash_value[i],line)}
#ary = [hash_key,lines].transpose
#h = Hash[*ary]
h = [hash_key,lines].transpose.to_h

p(h)
