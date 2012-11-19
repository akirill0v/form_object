require 'test_helper'

class FormRelationTest < TestCase
  def setup
    @form = Filter.new(query: "find me")
  end

  def test_should_not_form_get_model
    assert_respond_to @form, :model
    assert @form.model.nil?
  end
end
