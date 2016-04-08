module ToEnglish
  CONVERT_UNDER_20 =
    {}.tap do |hash|
      %w( zero one two three four five six seven eight
          nine ten eleven twelve thirteen fourteen fifteen sixteen
          seventeen eighteen nineteen ).each_with_index do |value, key|
        hash[key] = value
      end
    end.freeze

  CONVERT_10_DIGIT =
    {}.tap do |hash|
      %w( twenty thirty forty fifty sixty seventy
          eighty ninety).each.with_index(2) do |value, key|
        hash[key] = value
      end
    end.freeze

  CONVERT_BIG_DIGIT =
    {}.tap do |hash|
      %w( thousand million billion trillion ).each.with_index(1) do |value, key|
        hash[key] = value
      end
    end.freeze
end
