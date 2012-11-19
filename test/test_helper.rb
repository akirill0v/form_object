require 'bundler/setup'
Bundler.require
require 'minitest/autorun'
require 'turn/autorun'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

MiniTest::Unit.autorun

class TestCase < MiniTest::Unit::TestCase
end
