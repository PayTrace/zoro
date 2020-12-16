# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zoro/version'

Gem::Specification.new do |gem|
  gem.name          = "zoro"
  gem.version       = Zoro::VERSION
  gem.authors       = ["Trevor Redfern"]
  gem.email         = ["trevor@paytrace.com"]
  gem.description   = %q{Simple integration library into Zoho CRM. Will be enhanced to provide two way integration with library over time.}
  gem.summary       = %q{Ruby gem for integration with Zoho CRM}
  gem.homepage      = "https://github.com/PayTrace/zoro"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('rake')
  gem.add_development_dependency('mocha')
  gem.add_dependency('faraday')
  gem.add_dependency('xml-simple')
  gem.add_dependency('uri')
end
