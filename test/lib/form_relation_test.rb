require 'test_helper'

class FormRelationTest < TestCase
  def setup
    @attributes = { email: "test@example.com", name: "name" }
    @form = Filter.new(query: "find me")
    @model = User.new(@attributes)
  end

  def test_should_not_form_get_model
    assert_respond_to @form, :model
    assert_nil @form.model
  end

  def test_model_should_have_forms
    base_auth_form = @model.forms[:base_auth]
    assert @attributes[:email], base_auth_form.email
  end

  def test_model_hould_not_have_undefined_inForm_field
    base_auth_form = @model.forms[:base_auth]
    assert !base_auth_form.respond_to?( :name )
  end

end
