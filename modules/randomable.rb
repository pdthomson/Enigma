require 'date'

module Randomable

  def date_formatter
  date = Date.today
  date.strftime("%d/%m/%y").delete("/")
  end

  def key_generator
    rand(99999).to_s.rjust(5, "0")
  end
end
