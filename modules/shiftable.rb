require 'date'
require_relative '../modules/optionable'

module Shiftable

  def characters
    ("a".."z").to_a << " "
  end

  def create_offset(date)
    offset = (date.to_i) **2
    offset.to_s.slice(-4..-1)
  end

  def shift_array(offset, key)
    offset.each_char.with_index.map {|offset_char, index_string| offset_char.to_i + key.slice(index_string..index_string+1).to_i}
  end

  def encode(message, shift)
    encrypted_string = ''
    message.each_char do |string|
      if characters.include?(string) == nil?
      else
      shift_letter = characters.index(string) + shift[0]
      encrypted_string.concat(characters.rotate(shift_letter)[0])
      shift.rotate!
      end
    end
    encrypted_string
  end
end
