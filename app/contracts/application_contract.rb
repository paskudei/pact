# frozen_string_literal: true

class ApplicationContract < Dry::Validation::Contract
  config.messages.backend = :i18n

  # @param [Hash] args
  def self.call(args = {})
    new.call(args)
  end

  # @param [Hash] args
  # @return [Contracts::ApplicationError, Hash]
  def call(args = {})
    object = super

    raise Contracts::ApplicationError, object if object.failure?

    object.to_h
  end
end
