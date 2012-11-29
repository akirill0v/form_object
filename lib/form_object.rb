require "form_object/version"
require 'virtus'
require 'active_model'

module FormObject

  class ModelUndefinedError < RuntimeError
    def initialize( form )
      super "Model not defined for #{form.inspect}"
    end
  end

  autoload :Utils,                  'form_object/utils'
  autoload :Integrations,           'form_object/integrations'
  autoload :Base,                   'form_object/base'
  autoload :Store,                  'form_object/store'
  autoload :Dsl,                    'form_object/dsl'
  # Your code goes here...
end
