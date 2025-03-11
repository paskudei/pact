# frozen_string_literal: true

describe Users::CreateContract do
  subject(:contract) { described_class }

  describe '.call' do
    subject(:contract_call) { contract.call(params) }

    context 'with success result' do
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

      let(:expected_result) do
        {
          user: {
            email: 'paskudeidb@gmail.com',
            age: 29,
            gender: 'male',
            surname: nil,
            name: 'Денис',
            patronymic: 'Владимирович',
            nationality: 'Ру',
            country: 'Россия'
          },
          interests: [
            {
              name: 'Ruby'
            }
          ],
          skills: [
            {
              name: 'Specs'
            }
          ]
        }
      end

      it { is_expected.to eq(expected_result) }
    end

    context 'with exception' do
      let(:params) { {} }

      let(:error_message) do
        'Возникли ошибки: ' \
          'user Необходимо передать ключ атрибута, ' \
          'interests Необходимо передать ключ атрибута, ' \
          'skills Необходимо передать ключ атрибута'
      end

      it { expect { contract_call }.to raise_error(Contracts::ApplicationError, error_message) }
    end

    context 'with nested params exception' do
      let(:params) do
        {
          'user' => {
            'name' => nil
          },
          'interests' => [{}],
          'skills' => [{}]
        }
      end

      let(:error_message) do
        'Возникли ошибки: ' \
          'user.surname Необходимо передать ключ атрибута, ' \
          'user.name Значение не должно быть пустым, ' \
          'user.patronymic Необходимо передать ключ атрибута, ' \
          'user.email Необходимо передать ключ атрибута, ' \
          'user.age Необходимо передать ключ атрибута, ' \
          'user.nationality Необходимо передать ключ атрибута, ' \
          'user.country Необходимо передать ключ атрибута, ' \
          'user.gender Необходимо передать ключ атрибута, ' \
          'interests.0.name Необходимо передать ключ атрибута, ' \
          'skills.0.name Необходимо передать ключ атрибута'
      end

      it { expect { contract_call }.to raise_error(Contracts::ApplicationError, error_message) }
    end
  end
end
