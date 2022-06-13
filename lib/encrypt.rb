require './lib/enigma'
require_relative '../modules/randomable'

include Randomable

enigma = Enigma.new

key = key_generator
reading_file = File.open(ARGV[0], 'r')
writing_file = File.open(ARGV[1], "w")

encrypt_hash = enigma.encrypt(reading_file.read.chomp, key)
writing_file.write(encrypt_hash[:encryption])

puts "Created #{writing_file} with the key #{key} and the date #{encrypt_hash[:date]}"
