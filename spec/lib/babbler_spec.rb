require 'spec_helper'

describe Babbler do
  describe "#babble" do
    it "should return an appropriate random babble" do
      babble = Babbler.babble
      words = babble.split(" ")
      expect(words.length).to eq(2)
      expect(Babbler::ADJECTIVES.include? words[0]).to be(true)
      expect(Babbler::NOUNS.include? words[1]).to be(true)
    end

    it "should return the same babble given the same seed" do
      expect(Babbler.babble(1)).to eq(Babbler.babble(1))
    end

    it "should return two adjectives when configured like that" do
      Babbler.configure do |config|
        config.num_adjectives = 2
      end
      babble = Babbler.babble
      words = babble.split(" ")
      expect(words.length).to eq(3)
      expect(Babbler::ADJECTIVES.include? words[0]).to be(true)
      expect(Babbler::ADJECTIVES.include? words[1]).to be(true)
      expect(Babbler::NOUNS.include? words[2]).to be(true)
    end

    it "should use the safe word list when in safe mode" do
      Babbler.configure do |config|
        config.num_adjectives = 1
        config.safe_words = true
      end
      babble = Babbler.babble
      words = babble.split(" ")
      expect(words.length).to eq(2)
      expect(Babbler::SAFE_ADJECTIVES.include? words[0]).to be(true)
      expect(Babbler::SAFE_NOUNS.include? words[1]).to be(true)
    end
  end
end
