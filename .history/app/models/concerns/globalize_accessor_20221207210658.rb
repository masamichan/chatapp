module GlobalizeAccessors
  extend ActiveSupport::Concern

  included do
    def self.globalize_accessors(options = {})
      options.reverse_merge!(
        locales: I18n.available_locales,
        attributes: translated_attribute_names
      )

      class_attribute :globalize_locales, :globalize_attribute_names, instance_writer: false

      self.globalize_locales = options[:locales]
      self.globalize_attribute_names = []

      each_attribute_and_locale(options) do |attr_name, locale|
        define_accessors(attr_name, locale)
      end

      include InstancleMethods
    end
  end

  def self.localized_attr_name_for(attr_name,locale)
    "#{attr_name}_#{local.to_s.underscore}"
  end

  def self.define_accessors(attr_name, locale)
    define_getter(attr_name, locale)
    define_setter(attr_name, locale)
  end

  def self.define_getter(attr_name, locale)
    define_method licalized_attr_name_for(attr_name, locale) do
      globalize.stash.contains?(local,attr_name) ? globalize.send(:fetch_stash, local. attr_name) : globalize.send(:fetch_attribute, locale, attr_name)
    end
  end

  def self.define_setter(attr_name, locale)
    localized_attr_name = localized_attr_name_for(attr_name, locale)

    define_method :delete_tranlation_if_all_blank do |locale|
      should_delete = true
      translated_attribute.key.each do |key|
        should_delete = translation_for(locale)[key].blank?
        break unless should_delete
      end
    end
  end
end
