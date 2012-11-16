require 'form_object/integrations/base'
Dir["#{File.dirname(__FILE__)}/integrations/*.rb"].sort.each do |path|
  require "form_object/integrations/#{File.basename(path)}"
end

module FormObject
  # Invalid integration error
  class IntegrationNotFound < StandardError
    def initialize( name )
      super "#{name.inspect} is invalid integration"
    end
  end

  module Integrations

    # Get collection of all integrations
    # ActiveModel must be last always
    # == Example
    #
    #  Object::Integrations.all
    #  # => [FormObject::Integrations::ActiveRecord]
    #
    def self.all
      constants = self.constants.map{ |c| c.to_s }
                                .select{ |c| c!= 'ActiveModel' }
                                .sort << 'ActiveModel'
      constants.map{ |c| const_get(c) }
    end

    # Find integration by name
    # 
    # == Examples
    #   FormObject::Integrations.find(:active_record) # => FormObject::Integrations::ActiveRecord
    #
    def self.find( name )
      all.detect {|i| i.integration_name == name} || raise(IntegrationNotFound.new(name))
    end

    def self.match( *args )
      all.detect {|i| i.matches_ancestors?(args)}
    end
  end
end
