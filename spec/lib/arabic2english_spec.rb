require 'arabic2english'

describe Arabic2English do
  it { expect(1).to respond_to(:to_english) }

  it { expect(1.to_english).to eq('one') }
  it { expect(11.to_english).to eq('eleven') }
  it { expect(100.to_english).to eq('one hundred') }
end
