# frozen_string_literal: true

module Formable
  extend ActiveSupport::Concern

  included do
    def validate_form
      self.class.name.gsub('Interactor', 'Form').constantize.call(params)
    end
  end
end
