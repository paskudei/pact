# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    return unless User.exists?(email: value)

    record.errors.add(attribute, I18n.t('errors.messages.uniq'))
  end
end
