require 'date'

module Optionable

  def date_formatter
  date = Date.today
  date.strftime("%D").delete("/")
  # date.strftime("%m%d%y")
  end

  def key_generator
    rand(99999).to_s.rjust(5, "0")
  end
end
