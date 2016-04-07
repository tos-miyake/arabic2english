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
end
