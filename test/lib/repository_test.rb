require 'test_helper'

class RepositoryTest < TestCase

  def test_should_have_base_auth_in_collection
    assert_equal :base_auth, FormObject::Repository.instance[BaseAuthForm].name
  end

  def test_should_have_twitter_in_collection
    assert_equal :twitter, FormObject::Repository.instance[TwitterAuthForm].name
  end

end
