require 'date'
require_relative '../modules/randomable'
require_relative '../modules/shiftable'

class Enigma
  include Randomable
  include Shiftable

  def encrypt(message, key = key_generator, date = date_formatter)
    encrypt_hash = {}
    require "pry"; binding.pry
    shifter = shift_array(create_offset(date), key)
    encrypt_hash[:encryption] = encode(message.downcase, shifter)
    encrypt_hash[:key] = key
    encrypt_hash[:date] = date
    encrypt_hash
  end

  def decrypt(encrypted_message, key, date = date_formatter)
    decrypt_hash = {}
    shifter = shift_array(create_offset(date), key)
    decrypt_hash[:decryption] = decode(encrypted_message, shifter)
    decrypt_hash[:key] = key
    decrypt_hash[:date] = date
    decrypt_hash
  end
end
