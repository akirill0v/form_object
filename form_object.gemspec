# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'form_object/version'

Gem::Specification.new do |gem|
  gem.name          = "form_object"
  gem.version       = FormObject::VERSION
  gem.authors       = ["Kirillov Alexander"]
  gem.email         = ["saratovsource@gmail.com"]
  gem.description   = "Form objects for ruby on rails applications."
  gem.summary       = "Form object implementation"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
