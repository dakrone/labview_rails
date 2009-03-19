#!/usr/bin/env ruby

if ARGV[0].nil?
  puts "Need a database"
  exit
end

require 'rubygems'
require 'sqlite3'
require 'ping'

db = SQLite3::Database.new(ARGV[0])

rows = db.execute("SELECT * FROM `machines`")

#UPDATE table SET field2 = " . $value2 . " WHERE id = " . $id . "

rows.each do |r|
  id = r[0]
  ip = r[2]
  ping = Ping.pingecho(ip,2)
  #puts "#{id} - #{ip}"

  db.execute("UPDATE `machines` SET 'up_status'='#{ping}' WHERE id = #{id}")

end
