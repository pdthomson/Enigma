require './lib/enigma'
require_relative '../modules/randomable'

include Randomable

enigma = Enigma.new

reading_file = File.open(ARGV[0], "r")
writing_file = File.open(ARGV[1], "w")
key = ARGV[2]
date = ARGV[3]

decrypt_hash = enigma.decrypt(reading_file.read, key, date)
writing_file.write(decrypt_hash[:decryption])

puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
