Dir.foreach('data/lyricdata/') do |filename|
	next if filename == '.' or filename == '..'
	file =  File.read('data/lyricdata/' + filename) 
	if file.length < 500
		File.delete('data/lyricdata/' + filename)
	end
end