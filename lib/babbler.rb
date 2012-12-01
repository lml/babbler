require "babbler/version"
require "babbler/words"

module Babbler

    class << self

    def babble(seed = nil)
      prng = Random.new(seed || Random.new_seed)

      adjectives = []
      Babbler.config.num_adjectives.times do
        adjectives.push(ADJECTIVES[prng.rand(ADJECTIVES.length)])
      end
      noun = NOUNS[prng.rand(NOUNS.length)]

      "#{adjectives.join(' ')} #{noun}"
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

      def initialize      
        @num_adjectives = 1
        super
      end
    end
        
  end
end
