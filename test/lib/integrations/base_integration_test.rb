require 'test_helper'

module Integrations
  class BaseIntegrationTest < ::TestCase
    def setup
    end

    def test_filter_class_should_not_have_integrations
      assert_nil FormObject::Integrations.match(Filter)
    end
  end
end
