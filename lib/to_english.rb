require 'to_english/constant'

module ToEnglish
  def to_english
    CONVERT_UNDER_20[self]
  end
end

class Integer
  include ToEnglish
end
