# frozen_string_literal: true

class UserSerializer < ApplicationSerializer
  root_key :user, :users

  attributes \
    :id,
    :email,
    :age,
    :nationality,
    :country,
    :gender,
    :surname,
    :name,
    :patronymic,
    :full_name

  many :interests, resource: InterestSerializer
  many :skills, resource: SkillSerializer
end
