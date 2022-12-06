require "mail"

module EmailVaildable
  extend ActiveSupport::Concern

  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      record.errors.add(attribute, options[:message] || "is not an email") unless Tueemail.valid?(value.to_s, with: :regex)
    end
  end
end