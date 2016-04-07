require 'to_english'

describe ToEnglish do
  it { expect(1).to respond_to(:to_english) }

  it { expect(1.to_english).to eq('one') }
  it { expect(3.to_english).to eq('three') }
  it { expect(11.to_english).to eq('eleven') }
end
