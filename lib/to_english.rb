require_relative 'to_english/constant'

module ToEnglish

  def to_english
    sign = self.negative? ? 'minus ' : ''
    return 'sorry, I can`t count. too big.' if 999_999_999_999_999 < self
    return 'sorry, I can`t count. too small.' if - 999_999_999_999_999 > self
    result = self.abs.to_english_recursively
    result.gsub!(/^and /, "")
    if too_long?
      CONVERT_BIG_DIGIT.values.each do |replaceword|
        result.gsub!(/#{replaceword}/, "#{replaceword},")
      end
    end
    "#{sign}#{result}"
  end

  def to_english_recursively
    case self
    when 0..19
      "and #{CONVERT_UNDER_20[self]}"
    when 20..99
      "and #{under100_to_english}"
    when 100..999
      under1_000_to_english self
    else
      big_number_to_english self
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
    _100digit_english = (num / 100).to_english_recursively
    _100digit_english.gsub!(/^and /, '')
    under_100_english = nil
    unless (under100 = (num % 100)).zero?
     under_100_english =  under100.to_english_recursively
    end
    if under_100_english
      "#{_100digit_english} hundred #{under_100_english}"
    else
      "#{_100digit_english} hundred"
    end
  end

  def big_number_to_english num
    index = big_number_index(num)
    big_number_prefix = CONVERT_BIG_DIGIT[index]
    big_number_english = (num / 1000**index).to_english_recursively
    big_number_english.gsub!(/^and /, '')
    under_big_number_english = nil
    unless (under_big_number = (num % 1000**index)).zero?
     under_big_number_english =  under_big_number.to_english_recursively
    end
    if under_big_number_english
      "#{big_number_english} #{big_number_prefix} #{under_big_number_english}"
    else
      "#{big_number_english} #{big_number_prefix}"
    end
  end

  def too_long?
    count=0
    num = self.abs
    until num == 0
      count+=1 unless (num % 1000).zero?
      num /= 1000
    end
    count > 2
  end

  def big_number_index big_num
    index=0
    num = big_num
    until num == 0
      index+=1 unless (num /= 1000).zero?
    end
    index
  end

end

class Integer
  include ToEnglish
end
