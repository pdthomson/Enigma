require 'date'

module Randomable

  def date_formatter
  date = Date.today
  date.strftime("%D").delete("/")
  end

  def key_generator
    rand(99999).to_s.rjust(5, "0")
  end
end
