require 'spec_helper'

describe Babbler do

  describe "#babble" do
    before(:each) { Babbler.config.num_adjectives = 1 }

    it "should return an appropriate random babble" do
      babble = Babbler.babble
      words = babble.split(" ")
      words.length.should == 2
      Babbler.adjectives.should include(words[0])
      Babbler.nouns.should include(words[1])
    end

    it "should return the same babble given the same seed" do
      Babbler.babble(1).should == Babbler.babble(1)
    end

    it "should return two adjectives when configured like that" do
      Babbler.configure do |config|
        config.num_adjectives = 2
      end
      babble = Babbler.babble
      words = babble.split(" ")
      words.length.should == 3
      Babbler.adjectives.should include(words[0], words[1])
      Babbler.nouns.should include(words[2])
    end

    it "should return the last combination from safer_words_1" do
      Babbler.config.word_list = :safer_words_1
      allow_any_instance_of(Random).to receive(:rand).and_return(1161, 3038)
      Babbler.babble().should == "naval apology"
    end

    it "should return the last combination from california_words" do
      Babbler.config.word_list = :california_words
      allow_any_instance_of(Random).to receive(:rand).and_return(1128, 942)
      Babbler.babble().should == "finicky skin"
    end
  end

end
