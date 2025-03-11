# frozen_string_literal: true

describe UserSerializer do
  let(:serializer) { described_class.new(user) }
  let(:user) { create(:user) }

  describe '#to_json' do
    subject { JSON.parse(serializer.to_json) }

    context 'without relations' do
      let(:expected_result) do
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
            'interests' => [],
            'skills' => []
          }
        }
      end

      it { is_expected.to eq(expected_result) }
    end

    context 'with relations' do
      let(:skill) { create(:skill) }
      let(:interest) { create(:interest) }

      let(:expected_result) do
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

      before do
        create(:user_skill, user:, skill:)
        create(:user_interest, user:, interest:)
      end

      it { is_expected.to eq(expected_result) }
    end
  end
end
