require 'shot_holder'

describe 'ShotHolder' do
  let(:test_holder) { ShotHolder.new }

  context 'when initialised' do
    it 'has an iterator' do
      expect(test_holder).to respond_to(:iterator)
    end

    it 'has the iterator set at 1' do
      expect(test_holder.iterator).to eq(1)
    end

    it 'has a hash for shots' do
      expect(test_holder).to respond_to(:shots)
    end

    it 'is initialised with 0 shots' do
      expect(test_holder.shots.length).to eq(0)
    end

    it 'can be initialised with shots' do
      test_holder_with_shots = ShotHolder.new(2)
      expect(test_holder_with_shots.shots.length).to eq(2)
    end
  end

  context 'when adding a shot' do
    it 'adds the new shot to the hash' do
      expect { test_holder.add_shot }
        .to change { test_holder.shots.length }.from(0).to(1)
    end

    it 'increases the iterator' do
      expect { test_holder.add_shot }
        .to change { test_holder.iterator }.from(1).to(2)
    end
  end

  context 'when bowling' do
    it 'knows if all the shots are taken' do
      
    end
  end
end
