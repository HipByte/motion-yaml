# -*- encoding: utf-8 -*-
Version = "1.0"

Gem::Specification.new do |gem|
  gem.name          = "motion-yaml"
  gem.version       = Version
  gem.authors       = ["Watson"]
  gem.email         = ["watson1978@gmail.com"]
  gem.description   = %q{motion-yaml}
  gem.summary       = %q{motion-yaml}
  gem.homepage      = ""

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*'))
  gem.files         = files
  gem.require_paths = ["lib"]
end
