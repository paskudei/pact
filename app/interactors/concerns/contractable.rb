# frozen_string_literal: true

module Contractable
  extend ActiveSupport::Concern

  included do
    def contract_params
      @contract_params ||= self.class.name.gsub('Interactor', 'Contract').constantize.call(params)
    end
  end
end
