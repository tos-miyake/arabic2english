module ToEnglish
  def to_english
    case self
    when 1
      'one'
    when 3
      'three'
    when 11
      'eleven'
    end
  end
end

class Integer
  include ToEnglish
end
