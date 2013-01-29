require 'bundler/setup'
Bundler.require
require 'minitest/autorun'
require 'turn/autorun'

require 'simplecov'
require 'coveralls'


SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  load_adapter "test_frameworks"
end

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}
#MiniTest::Unit.autorun

class TestCase < MiniTest::Unit::TestCase
end
