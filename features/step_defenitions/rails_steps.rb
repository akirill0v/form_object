When /^I add "([^"]+)" from this project as a dependency$/ do |gem_name|
  append_to_file('Gemfile', %{gem "#{gem_name}", :path => "#{PROJECT_ROOT}"\n})
end

When /^I add "([^"]+)" as a dependency$/ do |gem_name|
  append_to_file('Gemfile', %{gem "#{gem_name}"\n})
end

Given /^I have a site set up$/ do
  step %{I successfully run `bundle exec rails new testapp`}
  step %{I cd to "testapp"}
  step %{I successfully run `bundle install`}
end

