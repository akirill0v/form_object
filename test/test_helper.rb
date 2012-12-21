require 'bundler/setup'
Bundler.require
require 'minitest/autorun'
require 'turn/autorun'
require 'coveralls'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Coveralls.wear!

MiniTest::Unit.autorun

class TestCase < MiniTest::Unit::TestCase
end
