require 'date'
require_relative '../modules/randomable'

class Enigma
  include Randomable

  def encrypt(message, key = key_generator, date = date_formatter)
#eventually the :encryption will have to actually be sent to the encrypter
# probably will have to pass date and key as one variable to the method for shift
# require "pry"; binding.pry
    enigma_hash = {}
    enigma_hash[:encryption] = "keder ohulw"
    enigma_hash[:key] = key
    enigma_hash[:date] = date
    enigma_hash
  end






end
