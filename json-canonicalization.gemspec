#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.version               = File.read('VERSION').chomp
  gem.date                  = File.mtime('VERSION').strftime('%Y-%m-%d')

  gem.name                  = "json-canonicalization"
  gem.homepage              = "http://github.com/dryruby/json-canonicalization"
  gem.license               = 'Unlicense'
  gem.summary               = "JSON Canonicalization for Ruby."
  gem.description           = "JSON::Canonicalization generates canonical JSON output from Ruby objects."

  gem.authors               = ['Gregg Kellogg']

  gem.platform              = Gem::Platform::RUBY
  gem.files                 = %w(AUTHORS README.md UNLICENSE VERSION) + Dir.glob('lib/**/*.rb')
  gem.test_files            = Dir.glob('spec/**/*.rb') + Dir.glob('spec/**/*.json')

  gem.required_ruby_version = '>= 2.2.2'
  gem.requirements          = []
  gem.add_development_dependency 'rspec',           '~> 3.8'
  gem.add_development_dependency 'yard' ,           '~> 0.9'

  gem.post_install_message  = nil
end
