# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'k8r/version'

Gem::Specification.new do |spec|
  spec.name          = 'k8r'
  spec.version       = K8r::VERSION
  spec.authors       = ['Tj (bougyman) Vanderpoel']
  spec.email         = ['tj@rubyists.com']

  spec.summary       = 'A modeled approach for interacting with Kubernetes from ruby.'
  spec.homepage      = 'https://github.com/rubyists/k8r'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.4'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
