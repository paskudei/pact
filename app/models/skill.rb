class Skill < ApplicationRecord
  # Я понимаю, что вы имели ввиду использование связи HABTM, но ТЗ не явное, поэтому на мой выбор :)
  # has_many :skill_users, dependent: :destroy
  # has_many :users, through: :skill_users

  belongs_to :user
end
