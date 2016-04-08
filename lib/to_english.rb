require_relative 'to_english/constant'

module ToEnglish

  def to_english
    sign = self.negative? ? 'minus ' : ''
    return 'sorry, I can`t count. too big.' if 999_999_999_999_999 < self
    return 'sorry, I can`t count. too small.' if - 999_999_999_999_999 > self
    result = to_english_recursively(self.abs)
    result.gsub!(/^and /, "")
    if too_long?
      CONVERT_BIG_DIGIT.values.each do |replaceword|
        result.gsub!(/#{replaceword}/, "#{replaceword},")
      end
    end
    "#{sign}#{result}"
  end


  private

  def to_english_recursively num
    case num
    when 0..19
      "and #{CONVERT_UNDER_20[num]}"
    when 20..99
      "and #{under100_to_english(num)}"
    when 100..999
      under1_000_to_english num
    else
      big_number_to_english num
    end
  end

  def under100_to_english num
    _1digit = num % 10
    _10digit = num / 10
    if _1digit.zero?
      CONVERT_10_DIGIT[_10digit]
    else
      "#{CONVERT_10_DIGIT[_10digit]}-#{CONVERT_UNDER_20[_1digit]}"
    end
  end

  def under1_000_to_english num
    _100digit_english = to_english_recursively((num / 100))
    _100digit_english.gsub!(/^and /, '')
    under_100_english = nil
    unless (under100 = (num % 100)).zero?
     under_100_english =  to_english_recursively(under100)
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
    big_number_english = to_english_recursively(num / 1000**index)
    big_number_english.gsub!(/^and /, '')
    under_big_number_english = nil
    unless (under_big_number = (num % 1000**index)).zero?
     under_big_number_english =  to_english_recursively(under_big_number)
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
