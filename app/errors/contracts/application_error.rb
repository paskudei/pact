# frozen_string_literal: true

module Contracts
  class ApplicationError < StandardError
    attr_reader :object

    def initialize(object)
      @object = object

      errors = object.errors.messages.map do |message|
        "#{message.path.join('.')} #{message.text}"
      end.join(', ')
      super(I18n.t('dry_validation.errors.messages.validation_invalid', errors:))
    end

    def record
      Struct.new(:errors).new(
        object.errors.map do |error|
          Struct.new(:attribute, :type, :message).new(
            error.path.join('.'),
            error.predicate,
            error.text
          )
        end
      )
    end
  end
end
