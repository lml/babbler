require "babbler/version"
require "babbler/words"

module Babbler

    class << self

    def babble(seed = nil)
      prng = Random.new(seed || Random.new_seed)

      adjective = ADJECTIVES[prng.rand(ADJECTIVES.length)]
      noun = NOUNS[prng.rand(NOUNS.length)]

      "#{adjective} #{noun}"
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
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

    class Configuration
      attr_accessor :example_setting

      def initialize      
        @example_setting = nil
        super
      end
    end
        
  end
end
