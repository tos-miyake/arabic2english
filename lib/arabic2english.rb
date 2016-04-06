module Arabic2English
  def to_english
    case self
    when 1
      "one"
    when 11
      "eleven"
    when 100
      "one hundred"
    end
  end
end

class Integer
  include Arabic2English
end
