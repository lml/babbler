require "babbler/version"
require "babbler/original_words"
require "babbler/safer_words_1"
require "babbler/california_words"

module Babbler

  class << self

    def babble(seed = nil)
      prng = Random.new(seed || Random.new_seed)

      babble_words = []

      Babbler.config.num_adjectives.times do
        babble_words.push(adjectives[prng.rand(adjectives.length)])
      end

      babble_words.push(nouns[prng.rand(nouns.length)])

      babble_words.join(' ')
    end

    def words
      case Babbler.config.word_list
      when :original
        ORIGINAL_WORDS
      when :safer_words_1
        SAFER_WORDS_1
      when :california_words
        CALIFORNIA_WORDS
      else
        raise NameError, "Unknown 'word_list' configuration: #{Babbler.config.word_list}"
      end
    end

    def adjectives
      words[:adjectives]
    end

    def nouns
      words[:nouns]
    end

    ###########################################################################
    #
    # Configuration machinery.
    #
    # To configure Babbler, put the following code in your applications
    # initialization logic (eg. in the config/initializers in a Rails app)
    #
    #   Babbler.configure do |config|
    #     ...
    #   end
    #

    def configure
      yield config
    end

    def config
      @configuration ||= Configuration.new
    end

    class Configuration
      attr_accessor :num_adjectives
      attr_accessor :word_list

      def initialize
        @num_adjectives = 1
        @word_list = :original
        super
      end
    end

  end
end
