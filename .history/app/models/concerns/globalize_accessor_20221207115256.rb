module GlobalizeAccessors
  extend AccitveSupport::Concern

  included do
    def self.globalize_accessor(options = {})
      options.reverse_merge!(
        locales: I18n.available_locales,
        attributes: translated_attribute_names
      )
    end
  end
end
