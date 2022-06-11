require 'date'
require_relative '../modules/randomable'

class Enigma
  include Randomable
  def encrypt(message, key, date)
    enigma_hash = {}
    enigma_hash[:encryption] = "keder ohulw"
    enigma_hash[:key] = key
    enigma_hash[:date] = date
    enigma_hash
  end






end
