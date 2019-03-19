$:.unshift(File.join("../../lib", __FILE__))

require "bundler/setup"
require 'rspec'

begin
  require 'simplecov'
  require 'coveralls' unless ENV['NOCOVERALLS']
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
    SimpleCov::Formatter::HTMLFormatter,
    (Coveralls::SimpleCov::Formatter unless ENV['NOCOVERALLS'])
  ])
  SimpleCov.start do
    add_filter "/spec/"
  end
rescue LoadError
end

require 'json/canonicalization'

::RSpec.configure do |c|
  c.filter_run focus: true
  c.run_all_when_everything_filtered = true
end
