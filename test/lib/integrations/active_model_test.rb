require 'test_helper'

module Integrations
  # Test ActiveModel integration
  class ActiveModelTest < ::TestCase
    # Test setup
    def setup
      @integration_name = :active_model
    end

    def test_should_integration_finded_by_name
      assert_equal FormObject::Integrations::ActiveModel, FormObject::Integrations.find_by_name(@integration_name)
    end

  end
end
