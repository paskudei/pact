# frozen_string_literal: true

class SkillSerializer < ApplicationSerializer
  root_key :skill, :skills

  attributes \
    :id,
    :name
end
