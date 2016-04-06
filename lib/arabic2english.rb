module Arabic2English
  ENGLISH_NUMBER_UNDER_20 =
    {}.tap do |hash|
      %w[ zero one two three four five six
          seven eight nine ten eleven twelve
          thirteen fourteen fifteen sixteen seventeen
          eighteen nineteen ].each_with_index do |value, key|
        hash[key] = value
      end
    end.freeze

  ENGLISH_NUMBER_TY =
    {}.tap do |hash|
      %w[ twenty thirty forty fifty sixty seventy
          eighty ninety].each.with_index(2) do |value, key|
        hash[key] = value
      end
    end.freeze


  def to_english
    xxxx_dizit = thousand_num_to_english(self)
    xxx_dizit = hundred_num_to_english(self)
    xx_dizit = under_hundred_num_to_english(self)
    xxxx_xxx_pading = (xxxx_dizit && xxx_dizit) ? ' ' : ''
    xxx_xx_pading = ((xxxx_dizit || xxx_dizit)&& xx_dizit) ? ' and ' : ''
    "#{xxxx_dizit}#{xxxx_xxx_pading}#{xxx_dizit}#{xxx_xx_pading}#{xx_dizit}"
  end

  private

  def thousand_num_to_english(num)
    thousand_num = num / 1000
    return if thousand_num.zero?
    "#{ENGLISH_NUMBER_UNDER_20[thousand_num]} thousand"
  end

  def hundred_num_to_english(num)
    hundred_num = (num % 1000) / 100
    return if hundred_num.zero?
    "#{ENGLISH_NUMBER_UNDER_20[hundred_num]} hundred"
  end

  def under_hundred_num_to_english(num)
    under_hundred_num = num % 100
    return if under_hundred_num.zero?
    case under_hundred_num
    when 0..19
      ENGLISH_NUMBER_UNDER_20[under_hundred_num]
    else
      _10_digit = under_hundred_num / 10
      _1_digit = under_hundred_num % 10
      if _1_digit == 0
        ENGLISH_NUMBER_TY[_10_digit]
      elsif _10_digit == 0
        ENGLISH_NUMBER_UNDER_20[_1_digit]
      else
      "#{ENGLISH_NUMBER_TY[_10_digit]}-#{ENGLISH_NUMBER_UNDER_20[_1_digit]}"
      end
    end
  end
end

class Integer
  include Arabic2English
end
