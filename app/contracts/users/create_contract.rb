# frozen_string_literal: true

module Users
  class CreateContract < ApplicationContract
    params do
      required(:user).hash do
        required(:surname).maybe(:string)
        required(:name).filled(:string)
        required(:patronymic).filled(:string)
        required(:email).filled(:string)
        required(:age).filled(:integer)
        required(:nationality).filled(:string)
        required(:country).filled(:string)
        required(:gender).filled(:string)
      end

      required(:interests).array(:hash) do
        required(:name).filled(:string)
      end

      required(:skills).array(:hash) do
        required(:name).filled(:string)
      end
    end
  end
end
