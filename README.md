# Babbler

Babbler is a Ruby gem that will make short nonsense phrases for you.  The phrases nominally consist of an adjective followed by a noun, though the number of adjectives can be configured.  The words in the phrase are common English words.

## Installation

Add this line to your application's Gemfile:

    gem 'babbler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install babbler

## Configuration

To configure Babbler, put the following code in your applications
initialization logic (eg. in the config/initializers in a Rails app)

    Babbler.configure do |config|
      ...
    end

The following example lists all of the available configuration options,
with the default values shown:

    Babbler.configure do |config|
      # Use a different number of adjectives at the start of the
      # phrase, e.g. with a value of 2 you might get 'hard ancient prosecutor'
      config.num_adjectives = 1
      # Choose a different word list. Options:
      #   :original - the original word list in Babbler
      #   :safer_words_1 - the original list with potentially awkward words removed
      #   :california_words - words 2nd graders in California are expected to know
      config.word_list = :original
    end

## Usage

To get a random babble, type:

    Babbler.babble

To always be able to get a specific babble, pass an integer in:

    Babbler.babble(42)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
3. Add tests
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
