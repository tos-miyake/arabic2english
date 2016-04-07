module ToEnglish
  CONVERT_UNDER_20 =
    {}.tap do |hash|
      %w( zero one two three four five six seven eight
          nine ten eleven twelve thirteen fourteen fifteen sixteen
          seventeen eighteen nineteen ).each_with_index do |value, key|
        hash[key] = value
      end
    end.freeze
end
