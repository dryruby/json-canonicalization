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
  gem.metadata           = {
    "documentation_uri" => "https://dryruby.github.io/json-canonicalization",
    "bug_tracker_uri"   => "https://github.com/dryruby/json-canonicalization/issues",
    "homepage_uri"      => "https://github.com/dryruby/json-canonicalization",
    "source_code_uri"   => "https://github.com/dryruby/json-canonicalization",
  }

  gem.authors               = ['Gregg Kellogg']

  gem.platform              = Gem::Platform::RUBY
  gem.files                 = %w(AUTHORS README.md LICENSE VERSION) + Dir.glob('lib/**/*.rb')
  gem.test_files            = Dir.glob('spec/**/*.rb') + Dir.glob('spec/**/*.json')

  gem.required_ruby_version = '>= 2.6'
  gem.requirements          = []
  gem.add_development_dependency 'rspec',           '~> 3.10'
  gem.add_development_dependency 'yard' ,           '~> 0.9'

  gem.post_install_message  = nil
end
