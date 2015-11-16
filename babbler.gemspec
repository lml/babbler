# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'babbler/version'

Gem::Specification.new do |gem|
  gem.name          = "babbler"
  gem.version       = Babbler::VERSION
  gem.authors       = ["JP Slavinsky"]
  gem.email         = ["jpslav@gmail.com"]
  gem.description   = %q{Creates nonsense babble in the form of an adjective plus a noun}
  gem.summary       = %q{Creates nonsense babble in the form of an adjective plus a noun.
                         Useful for creating code phrases or random names.  The words are
                         limited to common ones, so the number of unique combinations is
                         only around 5e6.}
  gem.homepage      = "http://github.com/lml/babbler"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rspec-mocks"
end
