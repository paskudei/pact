# frozen_string_literal: true

module Users
  class CreateForm < ApplicationForm
    attribute :email
    attribute :age
    attribute :gender
    attribute :surname
    attribute :name
    attribute :patronymic
    attribute :nationality
    attribute :country

    validates :email, email: true
    validates :age, between: 1..90
    validates :gender, enum: User.genders
  end
end
