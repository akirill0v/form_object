require "form_object/version"
require 'virtus'
require 'active_model'

module FormObject
  autoload :Base,       'form_object/base'
  autoload :Metadata,   'form_object/base/metadata'
  autoload :Repository, 'form_object/repository'
  autoload :Dsl,        'form_object/dsl'
  # Your code goes here...
end
