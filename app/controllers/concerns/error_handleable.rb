# frozen_string_literal: true

module ErrorHandleable
  extend ActiveSupport::Concern

  included do
    rescue_from Contracts::ApplicationError, with: :bad_request_response
    rescue_from Forms::ApplicationError, with: :unprocessable_entity_response

    private

    def bad_request_response(exception)
      render json: ErrorSerializer.new(exception.record.errors).to_json, status: :bad_request
    end

    def unprocessable_entity_response(exception)
      render json: ErrorSerializer.new(exception.record.errors).to_json, status: :unprocessable_entity
    end
  end
end
