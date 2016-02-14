require 'csv'
check_data =[]

Dir.foreach('data/lyricdata/') do |filename|
  next if filename == '.' or filename == '..'
  check_data << filename.chomp('.txt')
end


data = CSV.read('data/adddata/user_song_matrix.csv', :headers => true)
deldata = data.headers - check_data
deldata.each do |del_val|
	data.delete(del_val)
end


CSV.open("data/adddata/matrix.csv" ,"w") do |csvobject|
  csvobject << data.headers
  data.each do |row_arr|
    csvobject << row_arr
  end
end
