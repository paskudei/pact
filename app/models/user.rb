class User < ApplicationRecord
  has_many :interests, dependent: :destroy
  has_many :skills, dependent: :destroy
end
