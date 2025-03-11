# frozen_string_literal: true

module Swagger
  module Components
    module Skill
      SCHEMA = {
        type: :object,
        properties: {
          id: {
            type: :integer,
            example: 1,
            description: 'Skill ID'
          },
          name: {
            type: :string,
            example: 'Ruby',
            description: 'Название'
          }
        },
        required: %w[id name]
      }.freeze
    end
  end
end
