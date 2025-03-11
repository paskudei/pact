# frozen_string_literal: true

module Swagger
  module Components
    module UnprocessableEntity
      SCHEMA = {
        type: :array,
        items: {
          type: :object,
          properties: {
            attribute: {
              type: :string,
              description: 'Атрибут'
            },
            type: {
              type: :string,
              description: 'Тип ошибки'
            },
            message: {
              type: :string,
              description: 'Текст ошибки'
            }
          }
        },
        required: %i[
          attribute
          type
          message
        ]
      }.freeze
    end
  end
end
