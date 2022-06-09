require 'active_model'
require 'active_support/i18n'
I18n.load_path += Dir[File.dirname(__FILE__) + "/locale/*.yml"]
I18n.default_locale = :en

module ActiveModel
  module Validations
    class ImageValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        @record = record
        @attribute = attribute
        @value = value
        @options = options
    
        ratio_valid? if options[:ratio_range]
      end

      private

      attr_reader :record, :attribute, :value, :options
    
      def ratio_valid?
        return if value.blank?

        if ratio_range = options[:ratio_range]
          x = ratio_range.first
          y = ratio_range.last

          width = value.width
          height = value.height
          ratio = width.to_f / height

          return if ratio_range.member?(ratio)
      
          add_error(record, attribute, :aspect_ratio_is_not, "#{x}x#{y}")
        else
          add_error(record, attribute, :aspect_ratio_unknown)
        end
      end


      def add_error(record, attribute, type, interpolate = options[:with])
        key = options[:message].presence || type
        return if record.errors.added?(attribute, key)

        record.errors.add(attribute, key, aspect_ratio: interpolate)
      end
    end    
  end
end
