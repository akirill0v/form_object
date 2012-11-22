require "test_helper"

class IntegrationsTest < TestCase
  def setup
    @integrations = [
      FormObject::Integrations::Base,
      FormObject::Integrations::ActiveModel,
      FormObject::Integrations::ActiveRecord
    ]
    @base_form = BaseAuthForm.new(email: "test@example.com", name: "test")
    @twitter_form = TwitterAuthForm.new
  end

  def test_integrations_should_bee
    FormObject::Integrations.all.each do |integration|
      assert_includes @integrations, integration
    end
  end

end
