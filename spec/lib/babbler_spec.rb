require 'spec_helper'

describe Babbler do
  
  describe "#babble" do
    it "should return an appropriate random babble" do
      babble = Babbler.babble
      words = babble.split(" ")
      words.length.should == 2
      Babbler::ADJECTIVES.should include(words[0])
      Babbler::NOUNS.should include(words[1])
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
      Babbler::ADJECTIVES.should include(words[0], words[1])
      Babbler::NOUNS.should include(words[2])
    end
  end

end