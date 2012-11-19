module FormObject
  module Dsl
    autoload :ClassMethods, 'form_object/dsl/class_methods'
    autoload :InstanceMethods, 'form_object/dsl/instance_methods'

    def self.included(receiver) #:nodoc:
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end

  end
end
