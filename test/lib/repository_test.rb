require 'test_helper'

class RepositoryTest < TestCase

  def setup
    @repo = FormObject::Repository.instance
  end

  def test_should_have_base_auth_in_collection
    assert_equal BaseAuthForm, @repo.find(name: :base_auth).first.form
  end

  def test_should_have_twitter_in_collection
    assert_equal TwitterAuthForm, @repo.find(name: :twitter).first.form
  end

  def test_repo_shold_find_form_for_model
    critery = {}
    assert_operator 0, :<, @repo.find(critery).count
  end

  def test_should_find_by_model_class
    assert_equal User, @repo.find(model: User).first.model
  end

  def test_repo_shold_find_form_for_model_with_critery
    critery = {name: :base_auth}
    assert_operator 0, :<, @repo.find(critery).count
  end

  def test_should_not_find_forms_for_wrong_critery
    critery = { name: :wrong_name }
    assert_equal [], @repo.find(critery)
  end

end
