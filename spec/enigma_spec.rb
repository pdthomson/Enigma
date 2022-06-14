require 'enigma'
require 'date'
require_relative '../modules/randomable'
require_relative '../modules/shiftable'
include Randomable

RSpec.describe Enigma do
  let(:enigma) {Enigma.new}
  let(:message) {"hello world"}
  let(:encrypted_message) {"keder ohulw"}
  let(:key) {"02715"}
  let(:date) {"040895"}
  let(:offset) {"1025"}
  let(:shift) {[3, 27, 73, 20]}
  let(:unshift) {[3, 27, 73, 20]}

  it "exists" do
    expect(enigma).to be_an(Enigma)
  end

  it "can encrypt a message and return a Hash" do
    expected_date = date_formatter
    expected = ({
      :encryption => "keder ohulw",
      :key => "02715",
      :date => "040895"
      })

      allow(enigma).to receive(:rand).and_return(0)
      expect(enigma.encrypt(message, key, date)).to eq(expected)
      expect(enigma.encrypt(message, key)).to be_an(Hash)
      expect(enigma.encrypt(message, key)[:date]).to eq(expected_date)
      expect(enigma.encrypt(message)[:key]).to eq("00000")
      expect(enigma.encrypt(message)).to be_an(Hash)
  end

  it "can decrypt a message and return a hash" do
    expected_date = date_formatter
    expected = ({
      :decryption => "hello world",
      :key => "02715",
      :date => "040895"
      })

      expect(enigma.decrypt(encrypted_message, key, date)).to eq(expected)
      expect(enigma.decrypt(encrypted_message, key)[:date]).to eq(expected_date)
      expect(enigma.decrypt(encrypted_message, key)).to be_an(Hash)
  end

  it "can give me todays date formatted MMDDYY" do
    date = Date.today
    expected = date.strftime("%d/%m/%y").delete("/")
    expect(enigma.date_formatter).to eq(expected)
    expect(enigma.date_formatter).to be_an(String)
    expect(enigma.date_formatter.length).to eq(6)
  end

  it "can generate a random 5 digit number" do
    allow(enigma).to receive(:rand).and_return(0)
    expect(enigma.key_generator).to eq("00000")
    expect(enigma.key_generator).to be_an(String)
    expect(enigma.key_generator.length).to eq(5)
  end

  it "can create our list of valid characters" do
    expect(enigma.characters).to be_an(Array)
    expect(enigma.characters.count).to eq(27)
    expect(enigma.characters.first).to eq("a")
    expect(enigma.characters.last).to eq(" ")
  end

  it "can create the offset for the shift" do
    expect(enigma.create_offset(date)).to be_an(String)
    expect(enigma.create_offset(date).include?("1")).to eq(true)
    expect(enigma.create_offset(date).include?("5")).to eq(true)
  end

  it "can create the shift" do
    expect(enigma.shift_array(offset, key)).to be_an(Array)
    expect(enigma.shift_array(offset, key)).to eq([3, 27, 73, 20])
  end

  it "can encrypt a message" do
    expect(enigma.encode(message, shift)).to eq("keder ohulw")
    expect(enigma.encode(message, shift)).to be_an(String)
  end

  it "can check for valid characers and will keep invalid characters" do
    invalid_characters = "!h(e)l$l%o^1234&"
    expect(enigma.encode(invalid_characters, shift)).to eq("!k(e)d$e%r^1234&")
    expect(enigma.encode(invalid_characters, shift)).to be_an(String)
  end

  it "can decode an encrypted message" do
    expect(enigma.decode(encrypted_message, shift)).to eq("hello world")
  end

  it "can check for valid characers and will keep invalid characters" do
    invalid_characters = "!k(e)d$e%r^1234&"
    expect(enigma.decode(invalid_characters, shift)).to eq("!h(e)l$l%o^1234&")
    expect(enigma.decode(invalid_characters, shift)).to be_an(String)
  end
end
