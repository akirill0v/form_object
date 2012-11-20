require 'form_object/integrations/base'
Dir[File.join(File.dirname(__FILE__), "integrations", "*.rb")].sort.each do |path|
  require "form_object/integrations/#{File.basename(path)}"
end

module FormObject
  class InvalidIntegration < RuntimeError
    def initialize( name )
      super "#{name.inspect} is invalid integration"
    end
  end

  module Integrations

    # Find integrations for for selected class
    #
    # == Examples:
    #    class User
    #    end
    #
    #    class ActiveRecordUser < ActiveRecord::Base
    #    end
    #
    #    FormObject::Integrations.match(User) # => nil
    #    FormObject::Integrations.match(ActiveRecordUser) # => FormObject::Integrations::ActiveRecord
    def self.match( klass )
      
    end

    # Find integration by name
    #
    # == Examples:
    #    
    #    FormObject::Integrations.find_by_name(:active_record) # => FormObject::Integrations::ActiveRecord
    def find_by_name( name )
      
    end

    def self.all
      # ActiveModel should be last item
      constants = self.constants.map {|c| c.to_s}
                                .select {|c| c != 'ActiveModel'}
                                .sort <<          'ActiveModel'
      constants
    end
  end
end
