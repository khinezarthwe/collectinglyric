require 'csv'
result_arr = []
data = CSV.read('data/adddata/020.csv',headers:true)
dataheader = data.headers
Dir.foreach('data/adddata/20userdata') do |user_hash|
  next if user_hash == '.' or user_hash == '..'
  data = CSV.read('data/adddata/20userdata/' + user_hash, col_sep: ",")
  data.each do |check|
    dataheader.each do |test|
      if check[4] == test
        result_arr << [[check[4]],check[3],check[5]]
      end
    end

  end
end

CSV.open("data/adddata/output.csv" ,"w") do |csvobject|
  result_arr.uniq.each do |row_arr|
    csvobject << row_arr
  end
end