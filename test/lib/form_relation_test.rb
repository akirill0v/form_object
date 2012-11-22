require 'test_helper'

class FormRelationTest < TestCase
  def setup
    @form = Filter.new(query: "find me")
    @model = User.new(email: "test@example.com", name: "name")
  end

  def test_should_not_form_get_model
    assert_respond_to @form, :model
    assert_nil @form.model
  end

  def test_model_should_have_forms
    assert @model.forms[:base_auth]
  end

end
