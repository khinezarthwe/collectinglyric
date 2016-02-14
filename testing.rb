require 'csv'
check_data = ["00230ca5-a5f8-4a99-a318-aeadd6397930","004f22a2-6c7e-4895-bec4-3b03ecac2eda","00eca30e-ddfe-489b-8312-323522113493"]
data = CSV.read('test.csv',:headers => true)
check_data1 = data.headers - check_data
puts check_data1
check_data1.each do |del_val|
	data.delete(del_val)
end


CSV.open("data/adddata/output.csv" ,"w") do |csvobject|
  csvobject << data.headers
  data.each do |row_arr|
    csvobject << row_arr
  end
end

=begin
	
data = CSV.read('test.csv',:headers => true)
data.each do |check|
	check_data.each do |exit_del|
		if check == exit_del
			data.delete(check)
		end 
	end
end





data.headers.each do |exit_data|
  check_data.each do |exit_del|
    if check_data != data.headers
      data.delete(exit_data)
    end
  end
end


require 'whatlanguage'
w1 = WhatLanguage.new(:all)
Dir.foreach('data/lyricdata/') do |filename|
	next if filename == '.' or filename == '..'
	file =  File.read('data/lyricdata/' + filename) 
	if w1.language(file).to_s != 'english'
		File.delete('data/lyricdata/' + filename)
	end

end

=end
