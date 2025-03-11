# frozen_string_literal: true

class InterestSerializer < ApplicationSerializer
  root_key :interest, :interests

  attributes \
    :id,
    :name
end
