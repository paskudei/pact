# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    user = Users::CreateInteractor.new(params: params.as_json).call
    render json: UserSerializer.new(user).to_json, status: :created
  end
end
