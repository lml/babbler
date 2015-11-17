require "babbler/version"
require "babbler/original_words"
require "babbler/safer_words_1"
require "babbler/california_words"

module Babbler

  class << self

    def babble(seed = nil)
      prng = Random.new(seed || Random.new_seed)

      babble_words = supported_formats.collect do |f|
        send("format_#{f}")[prng.rand(send("format_#{f}").length)]
      end

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
      attr_accessor :format
      attr_accessor :word_list

      def initialize
        @format = 'an'
        @word_list = :original
        super
      end
    end

    private
    alias :format_a :adjectives
    alias :format_n :nouns

    def supported_formats
      sanitized = (Babbler.config.format || '').downcase
      formats = sanitized.split('').reject { |i| i.match(/[^an]/) }
      formats.any? ? formats : ['a', 'n']
    end

  end
end
