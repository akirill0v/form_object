require 'test_helper'

class FormObjectTest < TestCase
  def setup
    @form = Filter.new(query: "find me")
  end

  def test_should_form_not_persisted
    assert !@form.persisted?
  end

  def test_form_should_have_query_attribute
    assert "find me", @form.query
  end

  def test_should_be_valid_form
    assert @form.valid?
  end

  def test_should_be_invalid_with_empty_query
    @form.query = ""
    assert !@form.valid?
  end

  def test_should_have_not_nil_created_at_attribute
    assert @form.created_at.kind_of?(DateTime)
    assert @form.created_at.present?
  end

end
