require 'shot_holder'

describe 'ShotHolder' do
  context 'when initialised' do
    it 'has an iterator' do
      test_holder = ShotHolder.new
      expect(test_holder).to respond_to(:iterator)
    end

    it 'has the iterator set at 1' do
      test_holder = ShotHolder.new
      expect(test_holder.iterator).to eq(1)
    end
  end
end
