# frozen_string_literal: true

class ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  # @param [Hash] args
  def self.call(args = {})
    new(**args).call
  end

  # @return [Forms::ApplicationError, TrueClass]
  def call
    raise Forms::ApplicationError, self if invalid?

    true
  end
end
