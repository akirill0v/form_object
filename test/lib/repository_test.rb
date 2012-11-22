require 'test_helper'

class RepositoryTest < TestCase

  def setup
    @repo = FormObject::Repository.instance
  end

  def test_should_have_base_auth_in_collection
    assert_equal :base_auth, @repo[BaseAuthForm].name
  end

  def test_should_have_twitter_in_collection
    assert_equal :twitter, @repo[TwitterAuthForm].name
  end

  def test_repo_shold_find_form_for_model
    critery = {}
    assert_operator 0, :<, @repo.find_form(critery).count
  end

  def test_repo_shold_find_form_for_model_with_critery
    critery = {name: :base_auth}
    assert_operator 0, :<, @repo.find_form(critery).count
  end

  def test_should_not_find_forms_for_wrong_critery
    critery = { name: :wrong_name }
    assert_equal [], @repo.find_form(critery)
  end

end
