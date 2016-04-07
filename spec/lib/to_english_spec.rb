require 'to_english'

describe ToEnglish do
  it { expect(1).to respond_to(:to_english) }

  it { expect(1.to_english).to eq('one') }
  it { expect(3.to_english).to eq('three') }
  it { expect(11.to_english).to eq('eleven') }

  it { expect(20.to_english).to eq('twenty') }
  it { expect(21.to_english).to eq('twenty-one') }
  it { expect(45.to_english).to eq('forty-five') }
  it { expect(80.to_english).to eq('eighty') }

  it { expect(100.to_english).to eq('one hundred') }
  it { expect(119.to_english).to eq('one hundred and nineteen') }
  it { expect(221.to_english).to eq('two hundred and twenty-one') }
  it { expect(545.to_english).to eq('five hundred and forty-five') }
  it { expect(800.to_english).to eq('eight hundred') }
  it { expect(901.to_english).to eq('nine hundred and one') }
  it { expect(980.to_english).to eq('nine hundred and eighty') }
  it { expect(999.to_english).to eq('nine hundred and ninety-nine') }

  it { expect(1_000.to_english).to eq('one thousand') }
  it { expect(1_003.to_english).to eq('one thousand and three') }
  it { expect(1_015.to_english).to eq('one thousand and fifteen') }
  it { expect(1_040.to_english).to eq('one thousand and forty') }
  it { expect(1_100.to_english).to eq('one thousand one hundred') }
  it { expect(1_123.to_english).to eq('one thousand one hundred and twenty-three') }
  it { expect(10_123.to_english).to eq('ten thousand one hundred and twenty-three') }
  it { expect(100_123.to_english).to eq('one hundred thousand one hundred and twenty-three') }
  it { expect(120_123.to_english).to eq('one hundred and twenty thousand one hundred and twenty-three') }
  it { expect(113_123.to_english).to eq('one hundred and thirteen thousand one hundred and twenty-three') }

  it do
    expect(11_000_100.to_english).to \
      eq('eleven million one hundred')
  end
  it do
    expect(111_111_000.to_english).to \
      eq('one hundred and eleven million one hundred and eleven thousand')
  end
  it do
    expect(111_111_111.to_english).to \
      eq('one hundred and eleven million, one hundred and eleven thousand, one hundred and eleven')
  end
  it do
    expect(111_000_100.to_english).to \
      eq('one hundred and eleven million one hundred')
  end
  it do
    expect(111_001_100.to_english).to \
      eq('one hundred and eleven million, one thousand, one hundred')
  end

  it do
    expect(111_111_111_111.to_english).to \
      eq('one hundred and eleven billion, one hundred and eleven million, '\
          'one hundred and eleven thousand, one hundred and eleven')
  end
  it do
    expect(111_111_111_111_111.to_english).to \
      eq('one hundred and eleven trillion, one hundred and eleven billion, '\
          'one hundred and eleven million, one hundred and eleven thousand, '\
          'one hundred and eleven')
  end

  it do
    expect(1_000_000_000_000_000.to_english).to \
      eq('sorry, I can`t count. too big.')
  end

  it { expect(-1.to_english).to eq('minus one') }

  it do
    expect(-1_000_000_000_000_000.to_english).to \
      eq('sorry, I can`t count. too small.')
  end
end
