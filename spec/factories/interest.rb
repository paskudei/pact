# frozen_string_literal: true

FactoryBot.define do
  factory :interest do
    name { FFaker::Lorem.word }
  end
end
