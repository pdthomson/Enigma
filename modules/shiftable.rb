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
    offset.each_char.with_index.map {|char, index| char.to_i + key.slice(index..index+1).to_i}
  end





end
