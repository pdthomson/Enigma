require 'enigma'
require 'date'
require_relative '../modules/randomable'

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
      expect(enigma.encrypt(message, key)).to be_an(Hash)
      expect(enigma.encrypt(message)).to be_an(Hash)
  end

  it "can give me todays date formatted MMDDYY" do
#lets mock this one also passes what i want right now
    expect(enigma.date_formatter).to eq("061022")
    expect(enigma.date_formatter).to be_an(String)
    expect(enigma.date_formatter.length).to eq(6)
  end

  it "can generate a random 5 digit number" do
    #lets mock this one also
    expect(enigma.key_generator).to be_an(String)
    expect(enigma.key_generator.length).to eq(5)
  end

end
