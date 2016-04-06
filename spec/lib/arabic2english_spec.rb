require 'arabic2english'

describe Arabic2English do
  it { expect(1).to respond_to(:to_english) }

  it { expect(1.to_english).to eq('one') }
  it { expect(11.to_english).to eq('eleven') }
  it { expect(100.to_english).to eq('one hundred') }
  it { expect(101.to_english).to eq('one hundred and one') }
  it { expect(1000.to_english).to eq('one thousand') }
  it { expect(1003.to_english).to eq('one thousand and three') }
  it { expect(1015.to_english).to eq('one thousand and fifteen') }
  it { expect(1040.to_english).to eq('one thousand and forty') }
  it { expect(1200.to_english).to eq('one thousand two hundred') }
  it { expect(1201.to_english).to eq('one thousand two hundred and one') }
  it { expect(1214.to_english).to eq('one thousand two hundred and fourteen') }
  it { expect(1234.to_english).to eq('one thousand two hundred and thirty-four') }
end
