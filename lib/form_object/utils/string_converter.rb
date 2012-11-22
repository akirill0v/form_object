module FormObject
  module Utils
    module StringConverter

      def self.integration_name( word )
        name = word.split('::').last
        underscore(name)
      end

      def self.form_name( word )
        name = word.split('::').last
        name.gsub!(/Form/, '')
        underscore(name).to_sym
      end

      protected

      def self.underscore( original_word, options = {} )
        word = original_word.to_s.dup
        word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
        word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
        word.downcase!
        word
      end
    end
  end
end
