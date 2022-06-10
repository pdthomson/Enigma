require 'enigma'
require 'date'

RSpec.describe Enigma do
  let(:enigma) {Enigma.new}
  let(:message) {"hello world"}
  let(:key) {"02715"}
  let(:date) {"040895"}

  it "exists" do
    expect(enigma).to be_an(Enigma)
  end

  it "can encrypt a message and return a Hash" do
    expected = ({
      :encryption => "keder ohulw",
      :key => "02715",
      :date => "040895"
      })
      expect(enigma.encrypt(message, key, date)).to eq(expected)
  end
end
