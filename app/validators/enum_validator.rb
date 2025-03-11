# frozen_string_literal: true

class EnumValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.in?(options.keys)

    record.errors.add(attribute, I18n.t('errors.messages.enum', enum: options.keys.join(', ')))
  end
end
