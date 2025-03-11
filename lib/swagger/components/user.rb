# frozen_string_literal: true

module Swagger
  module Components
    module User
      SCHEMA = {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              id: {
                type: :integer,
                example: 1,
                description: 'User ID'
              },
              email: {
                type: :string,
                example: 'paskudeidb@gmail.com',
                description: 'Почта'
              },
              age: {
                type: :integer,
                example: 29,
                description: 'Возраст'
              },
              nationality: {
                type: :string,
                example: 'Русский',
                description: 'Национальность'
              },
              country: {
                type: :string,
                example: 'Россия',
                description: 'Страна'
              },
              gender: {
                type: :string,
                enum: %w[male female],
                description: 'Пол'
              },
              surname: {
                type: :string,
                example: 'Блохин',
                description: 'Фамилия',
                nullable: true
              },
              name: {
                type: :string,
                example: 'Денис',
                description: 'Имя'
              },
              patronymic: {
                type: :string,
                example: 'Владимирович',
                description: 'Отчество'
              },
              full_name: {
                type: :string,
                example: 'Блохин Денис Владимирович',
                description: 'ФИО'
              },
              interests: {
                type: :array,
                items: {
                  '$ref' => '#/components/schemas/interest'
                }
              },
              skills: {
                type: :array,
                items: {
                  '$ref' => '#/components/schemas/skill'
                }
              }
            },
            required: %i[
              id
              email
              age
              nationality
              country
              gender
              surname
              name
              patronymic
              full_name
              interests
              skills
            ]
          }
        },
        required: %w[user]
      }.freeze
    end
  end
end
