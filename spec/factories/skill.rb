# frozen_string_literal: true

FactoryBot.define do
  factory :skill do
    name { FFaker::Lorem.word }
  end
end
