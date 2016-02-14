require 'csv2json'
File.open('data/adddata/002.csv', 'r') do |input|
  File.open('data/adddata/output.json', 'w') do |output|
    CSV2JSON.parse(input, output)
  end
end
