require "test_helper"

class IntegrationsTest < TestCase
  def setup
  end

  def test_integrations_should_bee
    assert FormObject::Integrations.all.any?
  end
end
