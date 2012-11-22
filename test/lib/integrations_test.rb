require "test_helper"

class IntegrationsTest < TestCase
  def setup
    @integrations = [
      FormObject::Integrations::Base,
      FormObject::Integrations::ActiveModel,
      FormObject::Integrations::ActiveRecord
    ]
  end

  def test_integrations_should_bee
    FormObject::Integrations.all.each do |integration|
      assert_includes @integrations, integration
    end
  end
end
