require './console_table_formatter'


columns = [
  {"text" => "ENTRY", "width" => 34, "align" => :left}, 
  {"text" => "REFS", "width" => 4, "align" => :right}, 
]

data = [
  ["file01.rb Booking::Model#create",    1], 
  ["file01.rb Booking::Model#delete",    1], 
  ["file01.rb Booking::Model#exists?",   2], 
  ["file01.rb Booking::Model#find_all",  1], 
  ["file01.rb Booking::Model#find_one",  5], 
  ["file01.rb Booking::Model#status",    1], 
  ["file01.rb Booking::Model#update",    1], 
  ["file02.rb Booking::Handler#create",  0], 
  ["file02.rb Booking::Handler#delete",  0], 
  ["file02.rb Booking::Handler#find",    0], 
  ["file02.rb Booking::Handler#update",  0], 
]

table = ConsoleTableFormatter.new(columns)
table.total_func = lambda{["TOTAL", data.map{|d|d[1]}.sum]}
table.format data
