# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    age { FFaker::Number.between(from: 1, to: 90) }
    nationality { FFaker::Address.country }
    country { FFaker::Address.country }
    gender { FFaker::Gender.binary }
    surname { FFaker::Name.last_name }
    name { FFaker::Name.first_name }
    patronymic { FFaker::Name.first_name }
  end
end
