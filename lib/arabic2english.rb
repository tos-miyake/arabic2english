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
    else
      "#{ENGLISH_NUMBER_UNDER_20[self/100]} hundred"
    end
  end
end

class Integer
  include Arabic2English
end
