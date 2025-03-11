# frozen_string_literal: true

class ErrorSerializer < ApplicationSerializer
  attributes \
    :attribute,
    :type,
    :message
end
