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
end
