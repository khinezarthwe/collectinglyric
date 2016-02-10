require "csv"

module MergeCsv
  def self.run(csv_1_path, csv_2_path)
    csv_1 = CSV.read(csv_1_path, headers: true)
    csv_2 = CSV.read(csv_2_path, headers: true)
    mastercsv = merge(csv_1, csv_2)
  end

  def self.merge(csv_1, csv_2)
    headers = (csv_1.headers + csv_2.headers).uniq.sort

    hash_array = [csv_1, csv_2].flat_map &method(:csv_to_hash_array)

    CSV.generate do |merged_csv|
      merged_csv << headers

      hash_array.each do |row|
        merged_csv << row.values_at(*headers)
      end
    end
  end

  def self.csv_to_hash_array(csv)
    csv.to_a[1..-1].map do |row|
      Hash[csv.headers.zip(row)]
    end
  end
end

if(ARGV.length != 2)
  puts "Use: ruby merge_csv.rb <file_path_csv_1> <file_path_csv_2>"
  exit 1
end
result = MergeCsv.run(ARGV[0], ARGV[1])

arr_of_arrs = CSV.parse(result)

CSV.open("data/adddata/2"+".csv","w") do |csvobject|
    arr_of_arrs.each do |row_arr|
      csvobject << row_arr
    end
  end
