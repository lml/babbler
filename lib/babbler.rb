require "babbler/version"
require "babbler/words"

module Babbler

  class << self

    def babble(seed = nil)
      prng = Random.new(seed || Random.new_seed)

      adjectives = []
      Babbler.config.num_adjectives.times do
        adjectives.push(Babbler.adjectives_list[prng.rand(Babbler.adjectives_list.length)])
      end
      noun = Babbler.nouns_list[prng.rand(Babbler.nouns_list.length)]

      "#{adjectives.join(' ')} #{noun}"
    end

    def adjectives_list
      return ADJECTIVES unless Babbler.config.safe_words
      SAFE_ADJECTIVES
    end

    def nouns_list
      return NOUNS unless Babbler.config.safe_words
      SAFE_NOUNS
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
      attr_accessor :num_adjectives, :safe_words

      def initialize
        @num_adjectives = 1
        @safe_words = false
        super
      end
    end
  end
end
