require 'date'
require_relative '../modules/randomable'
require_relative '../modules/shiftable'

class Enigma
  include Randomable
  include Shiftable

  def encrypt(message, key = key_generator, date = date_formatter)
    enigma_hash = {}
    shifter = shift_array(create_offset(date), key)
    enigma_hash[:encryption] = encode(message, shifter)
    enigma_hash[:key] = key
    enigma_hash[:date] = date
    enigma_hash
  end






end
