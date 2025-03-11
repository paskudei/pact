# frozen_string_literal: true

describe SkillSerializer do
  let(:serializer) { described_class.new(skill) }
  let(:skill) { build(:skill) }

  describe '#to_json' do
    subject { JSON.parse(serializer.to_json) }

    let(:expected_result) do
      {
        'skill' => {
          'id' => skill.id,
          'name' => skill.name
        }
      }
    end

    it { is_expected.to eq(expected_result) }
  end
end
