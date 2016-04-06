module Arabic2English
  ENGLISH_NUMBER_UNDER_20 =
    {}.tap do |hash|
      %w[ zero  one   two  three four   five   six
          seven eight nine ten   eleven twelve
          thirteen fourteen fifteen sixteen seventeen
          eighteen nineteen ].each_with_index do |value, key|
        hash[key] = value
      end
    end.freeze
  def to_english
    case self
    when 0..19
      ENGLISH_NUMBER_UNDER_20[self]
    when 101
      'one hundred and one'
    when 1000
      'one thousand'
    when 1003
      'one thousand and three'
    when 1015
      'one thousand and fifteen'
    when 1040
      'one thousand and forty'
    when 1200
      'one thousand two hundred'
    when 1201
      'one thousand two hundred and one'
    when 1214
      'one thousand two hundred and fourteen'
    when 1234
      'one thousand two hundred and thirty-four'
    else
      "#{ENGLISH_NUMBER_UNDER_20[self/100]} hundred"
    end
  end
end

class Integer
  include Arabic2English
end
