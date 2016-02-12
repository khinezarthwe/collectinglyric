require 'rubygems'
require 'csv'
require 'lyricfy'
data = CSV.read('data/adddata/song_id,artistname_song_name2.csv')
fetcher = Lyricfy::Fetcher.new
data.each do |songdata|
  begin
    song = fetcher.search songdata[1],songdata[2]
    File.open('data/lyricdata/'+songdata[0]+ '.txt', 'w') {|f| f.write(song.body('')) }
  rescue Exception => e
    File.open('data/nolyric/'+songdata[0]+ '.txt', 'w') {|f| f.write(e.message) }
  end
end
