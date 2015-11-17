require 'spec_helper'

describe Babbler do

  describe "#babble" do
    before do
      Babbler.configure { |c| c.format = 'an' }
    end

    it "returns an appropriate random babble" do
      words = Babbler.babble.split(" ")

      expect(words.length).to be 2
      expect(Babbler.adjectives).to include(words.first)
      expect(Babbler.nouns).to include(words.last)
    end

    it "returns the same babble given the same seed" do
      expect(Babbler.babble(1)).to eq(Babbler.babble(1))
    end

    it "returns in the format configured" do
      Babbler.configure { |c| c.format = 'aa' }

      words = Babbler.babble.split(' ')

      expect(words.length).to be 2
      expect(Babbler.adjectives).to include(words.first, words.last)

      Babbler.configure { |c| c.format = 'a na' }

      words = Babbler.babble.split(' ')

      expect(words.length).to be 3
      expect(Babbler.adjectives).to include(words.first, words.last)
      expect(Babbler.nouns).to include(words[1])
    end

    it "returns the last combination from safer_words_1" do
      Babbler.config.word_list = :safer_words_1
      allow_any_instance_of(Random).to receive(:rand).and_return(1161, 3038)
      expect(Babbler.babble).to eq("naval apology")
    end

    it "returns the last combination from california_words" do
      Babbler.config.word_list = :california_words
      allow_any_instance_of(Random).to receive(:rand).and_return(1128, 942)
      expect(Babbler.babble).to eq("finicky skin")
    end
  end

end
