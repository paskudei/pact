# frozen_string_literal: true

describe Users::CreateForm do
  subject(:form) { described_class }

  describe '.call' do
    subject(:form_call) { form.call(params) }

    context 'with success result' do
      let(:params) do
        {
          email: 'paskudeidb@gmail.com',
          age: 29,
          gender: 'male',
          name: nil,
          patronymic: nil,
          nationality: nil,
          country: nil
        }
      end

      it { is_expected.to be(true) }
    end

    context 'with exception' do
      let(:params) { {} }

      let(:error_message) do
        'Возникли ошибки: Age должно быть в диапазоне 1..90, Gender должен быть одним из: male, female'
      end

      it { expect { form_call }.to raise_error(Forms::ApplicationError, error_message) }
    end
  end
end
