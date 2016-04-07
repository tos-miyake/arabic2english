require_relative 'to_english/constant'

module ToEnglish

  def to_english
    sign = self.negative? ? 'minus ' : ''
    return 'sorry, I can`t count. too big.' if 999_999_999_999_999 < self
    return 'sorry, I can`t count. too small.' if - 999_999_999_999_999 > self
    result = self.abs.to_english_recursively
    if to_long?
      [CONVERT_BIG_DIGIT.values, 'thousand'].flatten.each do |replaceword|
        result.gsub!(/#{replaceword}/, "#{replaceword},")
      end
    end
    "#{sign}#{result}"
  end

  def to_english_recursively
    case self
    when 0..19
      CONVERT_UNDER_20[self]
    when 20..99
      under100_to_english
    when 100..999
      under1_000_to_english self
    when 1000..999_999
      under1_000_000_to_english self
    when 1_000_000..999_999_999_999_999
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
    under_100_english = nil
    unless (under100 = (num % 100)).zero?
     under_100_english =  under100.to_english_recursively
    end
    if under_100_english
      "#{_100digit_english} hundred and #{under_100_english}"
    else
      "#{_100digit_english} hundred"
    end
  end

  def under1_000_000_to_english num
    _1000digit_english = (num / 1000).to_english_recursively
    under_1000_english = nil
    unless (under1000 = (num % 1000)).zero?
     under_1000_english =  under1000.to_english_recursively
    end
    if under_1000_english && (under1000/100).zero?
      "#{_1000digit_english} thousand and #{under_1000_english}"
    elsif under_1000_english
      "#{_1000digit_english} thousand #{under_1000_english}"
    else
      "#{_1000digit_english} thousand"
    end
  end

  def big_number_to_english num
    index = big_number_index(num)
    big_number_prefix = CONVERT_BIG_DIGIT[index]
    million_english = (num / 1000**index).to_english_recursively
    under_million_english = nil
    unless (under_million = (num % 1000**index)).zero?
     under_million_english =  under_million.to_english_recursively
    end
    if under_million_english
      "#{million_english} #{big_number_prefix} #{under_million_english}"
    else
      "#{million_english} #{big_number_prefix}"
    end
  end

  def to_long?
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
