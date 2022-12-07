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

      include InstanceMethods
    end
  end

  def self.localized_attr_name_for(attr_name,locale)
    "#{attr_name}_#{locale.to_s.underscore}"
  end

  def self.define_accessors(attr_name, locale)
    define_getter(attr_name, locale)
    define_setter(attr_name, locale)
  end

  def self.define_getter(attr_name, locale)
    define_method localized_attr_name_for(attr_name, locale) do
      globalize.stash.contains?(local,attr_name) ? globalize.send(:fetch_stash, locale, attr_name) : globalize.send(:fetch_attribute, locale, attr_name)
    end
  end

  def self.define_setter(attr_name, locale)
    localized_attr_name = localized_attr_name_for(attr_name, locale)

    define_method :delete_translation_if_all_blank do |locale|
      should_delete = true
      translated_attributes.keys.each do |key|
        should_delete = translation_for(locale)[key].blank?
        break unless should_delete
      end
      translations.where(locale: locale).delete_all if should_delete
    end

    define_method: :"#{localized_attr_name}=" do |value|
      if translation_for(locale, false) && value.blank?
        translation_for(lacale)[attr_name] = value
      else
        write_attribute(attr_name, value, locale: locale) if value.present?
        translation_for(locale)[attr_name] = value
      end
    end

    if respond_to?()
  end
end
