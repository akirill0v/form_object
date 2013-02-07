require 'test_helper'

class FormObjectTest < TestCase
  def setup
    @form = Filter.new(query: "find me")
    @base_form = BaseAuthForm.new(email: "test@example.com", name: "test")
    @twitter_form = TwitterAuthForm.new
  end

  def test_should_form_not_persisted
    refute @form.persisted?
  end

  def test_form_should_have_query_attribute
    assert "find me", @form.query
  end

  def test_should_be_valid_form
    assert @form.valid?
    assert @base_form.valid?
  end

  def test_should_be_invalid_with_empty_query
    @form.query = ""
    assert @form.invalid?
  end

  def test_should_have_not_nil_created_at_attribute
    assert_kind_of DateTime, @form.created_at
    assert @form.created_at.present?
  end

  def test_base_form_have_a_model
    assert_equal User, @base_form.class.model
  end

  def test_form_should_have_name
    assert_equal :base_auth, @base_form.class.form_name
    assert_equal :twitter_auth, @twitter_form.class.form_name
  end

end
