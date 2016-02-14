Dir.foreach('data/lyricdata/') do |filename|
	next if filename == '.' or filename == '..'
	file =  File.read('data/lyricdata/' + filename) 
	if file.length < 500
		File.delete('data/lyricdata/' + filename)
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

