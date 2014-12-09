require 'json'
require 'csv'
require 'rubygems'

def is_int(str)
  # Check if a string should be an integer
  return !!(str =~ /^[-+]?[1-9]([0-9]*)?$/)
end

lines = CSV.open("/home/caharsha/Documents/Code/csv2json/class_link.csv").readlines
keys = lines.delete lines.first

#lines = lines.each_line do |line|
#  line.sub(''',''','T')
#end
File.open("/home/caharsha/Documents/Code/csv2json/class_link.js", "w") do |f|
  f.puts "var eventList = " 
  data = lines.map do |values|
    is_int(values) ? values.to_i : values.to_s
    Hash[keys.zip(values)]
  end
  f.puts JSON.pretty_generate(data)
end
#csvdata = CSV.read("/home/caharsha/Documents/Code/csv2json/class_link.csv")
#csvdata.to_a
#csvdata.to_a
#csvdata.to_a
#csvdata.to_a.map {|row| row.to_hash }
#print csvdata



jsfile = File.read("/home/caharsha/Documents/Code/csv2json/class_link.js")
jsfile = jsfile.gsub("'","")
jsfile = jsfile.gsub('"start"', 'start')
jsfile = jsfile.gsub('"url"','url')
jsfile = jsfile.gsub('"description"','description')
jsfile = jsfile.gsub('"title"','title')
jsfile = jsfile.gsub!('"id"','id')


File.open("/home/caharsha/Documents/Code/csv2json/class_link.js", "w") do |f|
  f.puts jsfile
end
#print jsfile
#csvdata = CSV.new(body, :headers => true, :header_converters => :symbol, :converters => :all)
#csvdata.to_a.map {|row| row.to_hash }

#print csvdata

#print CSV.parse(csvdata).to_json
