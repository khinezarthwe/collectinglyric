require 'rubygems'
require 'lyricfy'

fetcher = Lyricfy::Fetcher.new
song = fetcher.search 'Elliott Smith', 'Placeholder'
p song.body("<br>")