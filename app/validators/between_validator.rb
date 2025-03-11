# frozen_string_literal: true

class BetweenValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.in?(options[:in])

    record.errors.add(attribute, I18n.t('errors.messages.in', count: options[:in]))
  end
end
