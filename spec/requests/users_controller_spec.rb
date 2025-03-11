# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe UsersController, type: :request do
  path '/users' do
    post 'Создание пользователя' do
      tags User

      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
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
                description: 'Фамилия'
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
            ]
          },
          interests: {
            type: :array,
            items: {
              type: :object,
              properties: {
                name: {
                  type: :string,
                  example: 'Specs',
                  description: 'Название'
                }
              },
              required: %i[name]
            }
          },
          skills: {
            type: :array,
            items: {
              type: :object,
              properties: {
                name: {
                  type: :string,
                  example: 'Ruby',
                  description: 'Название'
                }
              },
              required: %i[name]
            }
          }
        },
        required: %i[user interests skills]
      }

      consumes 'application/json'
      produces 'application/json'

      response 201, 'Created' do
        let!(:interest) { create(:interest, name: 'Specs') }
        let!(:skill) { create(:skill, name: 'Ruby') }

        let(:params) do
          {
            'user' => {
              'email' => 'paskudeidb@gmail.com',
              'age' => '29',
              'gender' => 'male',
              'surname' => nil,
              'name' => 'Денис',
              'patronymic' => 'Владимирович',
              'nationality' => 'Ру',
              'country' => 'Россия'
            },
            'interests' => [
              {
                'name' => 'Specs'
              }
            ],
            'skills' => [
              {
                'name' => 'Ruby'
              }
            ]
          }
        end

        let(:user) { User.last }
        let(:expected_response) do
          {
            'user' => {
              'id' => user.id,
              'email' => user.email,
              'age' => user.age,
              'nationality' => user.nationality,
              'country' => user.country,
              'gender' => user.gender,
              'surname' => user.surname,
              'name' => user.name,
              'patronymic' => user.patronymic,
              'full_name' => user.full_name,
              'interests' => [
                {
                  'id' => interest.id,
                  'name' => interest.name
                }
              ],
              'skills' => [
                {
                  'id' => skill.id,
                  'name' => skill.name
                }
              ]
            }
          }
        end

        schema '$ref' => '#/components/schemas/user'

        run_test! { expect(response.parsed_body).to eq(expected_response) }
      end

      response 400, 'Bad Request' do
        let(:params) { {} }

        schema '$ref' => '#/components/schemas/bad_request'

        run_test!
      end

      response 422, 'Unprocessable Entity' do
        let(:params) do
          {
            'user' => {
              'email' => 'paskudeidb@gmail.com',
              'age' => 0,
              'gender' => 'invalid',
              'surname' => nil,
              'name' => 'Денис',
              'patronymic' => 'Владимирович',
              'nationality' => 'Ру',
              'country' => 'Россия'
            },
            'interests' => [
              {
                'name' => 'Ruby'
              }
            ],
            'skills' => [
              {
                'name' => 'Specs'
              }
            ]
          }
        end

        schema '$ref' => '#/components/schemas/unprocessable_entity'

        run_test!
      end
    end
  end
end
