require 'csv'
result_arr = []

data1 = CSV.read('data/adddata/002.csv',headers:true)
dataheader = data1.headers
data = CSV.read('data/adddata/20userdata/User_3_2009.csv')
dataheader.each do |test|
  data.each do |check|
  if test == check[4]
   result_arr << [[check[4]],check[3],check[5]]
  end
  end
end
puts result_arr.uniq.count
CSV.open("data/adddata/output.csv" ,"w") do |csvobject|
  result_arr.each do |row_arr|
    csvobject << row_arr
  end
end