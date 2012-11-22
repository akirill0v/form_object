require "form_object/version"
require 'virtus'
require 'active_model'

module FormObject
  autoload :Utils,        'form_object/utils'
  autoload :Base,         'form_object/base'
  autoload :Metadata,     'form_object/base/metadata'
  autoload :Collection,   'form_object/base/collection'
  autoload :Repository,   'form_object/repository'
  autoload :Dsl,          'form_object/dsl'
  autoload :Integrations, 'form_object/integrations'
  # Your code goes here...
end
