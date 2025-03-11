# frozen_string_literal: true

describe Users::CreateInteractor do
  subject(:interactor) { described_class.new(params:) }

  describe '#call' do
    subject(:interactor_call) { interactor.call }

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

      before do
        create(:interest, name: 'Ruby')
        create(:skill, name: 'Specs')
      end

      it do
        expect { interactor_call }
          .to change(User, :count).by(1).and change(UserInterest, :count).by(1).and change(UserSkill, :count).by(1)
      end
    end

    context 'with contract error' do
      let(:params) { {} }

      let(:error_message) do
        'Возникли ошибки: ' \
          'user Необходимо передать ключ атрибута, ' \
          'interests Необходимо передать ключ атрибута, ' \
          'skills Необходимо передать ключ атрибута'
      end

      it { expect { interactor_call }.to raise_error(Contracts::ApplicationError, error_message) }
    end

    context 'with form error' do
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

      let(:error_message) do
        'Возникли ошибки: ' \
          'Email должен быть уникальным, ' \
          'Age должно быть в диапазоне 1..90, ' \
          'Gender должен быть одним из: male, female'
      end

      before { create(:user, email: 'paskudeidb@gmail.com') }

      it { expect { interactor_call }.to raise_error(Forms::ApplicationError, error_message) }
    end
  end
end
