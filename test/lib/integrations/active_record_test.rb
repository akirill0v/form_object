require 'test_helper'

module Integrations
  # Test ActiveRecord integration
  class ActiveRecordTest < ::TestCase
    # Test setup
    def setup
      @integration_name = :active_record
      @user = User.new email: "test@example.com"
    end

    def test_should_integration_finded_by_name
      assert_equal FormObject::Integrations::ActiveRecord, FormObject::Integrations.find_by_name(@integration_name)
    end

    def test_should_match_active_record_integration
      assert_equal FormObject::Integrations::ActiveRecord, FormObject::Integrations.match(User)
    end

    def test_should_have_base_auth_form_instance_for_user_model
      form = @user.form( :base_auth )
      assert form, "base_auth form is nil!"
    end

  end
end
