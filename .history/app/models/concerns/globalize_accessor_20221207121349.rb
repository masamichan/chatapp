module GlobalizeAccessors
  extend AccitveSupport::Concern

  included do
    def self.globalize_accessor(options = {})
      options.reverse_merge!(
        locales: I18n.available_locales,
        attributes: translated_attribute_names
      )

      class_attributes :globalize_locales, :globalize_attribute_names, instance_writer: false

      self.globalize_locales = options[:locales]
      self.globalize_attribute_names = []

      each_attribute_and_local(options) do |attr_name, locale|
        define_accessor(attr_name, locale)
      end

      include InstancleMethod
    end
  end
end
