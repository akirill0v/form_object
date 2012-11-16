require 'test_helper'

module Integrations

  class BaseTest < ::TestCase

    def setup
      superclass = Class.new
      self.class.const_set('Vehicle', superclass)
      
      @klass = Class.new(superclass)
    end

    def test_should_return_nil_if_match_not_found
      assert_nil FormObject::Integrations.match(@klass)
    end

  end
end
