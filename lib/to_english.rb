require 'to_english/constant'

module ToEnglish
  def to_english
    case self
    when 0..19
      CONVERT_UNDER_20[self]
    when 20..99
      under100_to_english
    end
  end

  private

  def under100_to_english
    _1digit = self % 10
    _10digit = self / 10
    if _1digit.zero?
      CONVERT_10_DIGIT[_10digit]
    else
      "#{CONVERT_10_DIGIT[_10digit]}-#{CONVERT_UNDER_20[_1digit]}"
    end
  end
end

class Integer
  include ToEnglish
end
