# frozen_string_literal: true

describe InterestSerializer do
  let(:serializer) { described_class.new(interest) }
  let(:interest) { build(:interest) }

  describe '#to_json' do
    subject { JSON.parse(serializer.to_json) }

    let(:expected_result) do
      {
        'interest' => {
          'id' => interest.id,
          'name' => interest.name
        }
      }
    end

    it { is_expected.to eq(expected_result) }
  end
end
