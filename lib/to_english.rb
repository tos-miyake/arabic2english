require 'to_english/constant'

module ToEnglish
  def to_english
    case self
    when 0..19
      CONVERT_UNDER_20[self]
    when 20..99
      under100_to_english
    when 100..999
      under1_000_to_english self
    when 1_000
      'one thousand'
    when 1_003
      'one thousand and three'
    when 1_015
      'one thousand and fifteen'
    when 1_040
      'one thousand and forty'
    when 1_100
      'one thousand one hundred'
    when 1_123
      'one thousand one hundred and twenty-three'
    when 10_123
      'ten thousand one hundred and twenty-three'
    when 100_123
      'one hundred thousand one hundred and twenty-three'
    when 120_123
      'one hundred and twenty thousand one hundred and twenty-three'
    when 113_123
      'one hundred and thirteen thousand one hundred and twenty-three'
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

  def under1_000_to_english num
    _100digit_english = CONVERT_UNDER_20[num / 100]
    under_100_english = nil
    unless (under100 = (num % 100)).zero?
     under_100_english =  under100.to_english
    end
    if under_100_english
      "#{_100digit_english} hundred and #{under_100_english}"
    else
      "#{_100digit_english} hundred"
    end
  end
end

class Integer
  include ToEnglish
end
