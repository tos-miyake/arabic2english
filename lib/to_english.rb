require 'to_english/constant'

module ToEnglish
  def to_english
    case self
    when 0..19
      CONVERT_UNDER_20[self]
    when 20..99
      under100_to_english
    when 100
      'one hundred'
    when 119
      'one hundred and nineteen'
    when 221
      'two hundred and twenty-one'
    when 545
      'five hundred and forty-five'
    when 800
      'eight hundred'
    when 901
      'nine hundred and one'
    when 980
      'nine hundred and eighty'
    when 999
      'nine hundred and ninety-nine'
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
