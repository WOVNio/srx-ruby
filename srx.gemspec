# frozen_string_literal: true

require_relative 'lib/srx/version'

Gem::Specification.new do |spec|
  spec.name          = 'srx'
  spec.version       = Srx::VERSION
  spec.authors       = ['Aaron Madlon-Kay']
  spec.email         = ['aaron@madlon-kay.com']

  spec.summary       = 'An SRX segmenting engine'
  spec.homepage      = 'https://github.com/amake/srx-ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/amake/srx-ruby.git'
  spec.metadata['changelog_uri'] = 'https://github.com/amake/srx-ruby/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri', '~>1.11'

  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'memory_profiler'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec-expectations'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'solargraph'
end
