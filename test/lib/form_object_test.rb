require 'test_helper'

class FormObjectTest < TestCase
  def setup
    @form = Filter.new
  end

  def test_should_form_not_persisted
    assert !@form.persisted?
  end
end
