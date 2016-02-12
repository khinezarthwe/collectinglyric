require 'rubygems'
require 'csv'
require 'lyricfy'
fetcher = Lyricfy::Fetcher.new
data = CSV.read('data/adddata/testdata.csv')
data.each do |songdata|
  begin
    song = fetcher.search songdata[1], songdata[2]
    File.open('data/2timetest/'+songdata[0]+ '.txt', 'w') {|f| f.write(song.body('')) }
  rescue Exception => e
    File.open('data/2timetest/no/'+songdata[0]+ '.txt', 'w') {|f| f.write(e.message) }
  end
end

#puts song.body # prints lyrics separated by '\n'
