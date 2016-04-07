require 'to_english/constant'

module ToEnglish
  def to_english
    case self
    when 0..19
      CONVERT_UNDER_20[self]
    when 20
      'twenty'
    when 21
      'twenty-one'
    when 45
      'forty-five'
    when 80
      'eighty'
    end
  end
end

class Integer
  include ToEnglish
end
