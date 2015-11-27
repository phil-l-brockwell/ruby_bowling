require 'shot'

describe 'Shot' do
  let(:shot) { Shot.new }

  context 'when initialised' do
    it 'is not taken' do
      expect(shot.taken).to eq(false)
    end
  end

  context 'when bowling' do
    before { shot.hit(1) }

    it 'can update its score' do
      expect(shot.score).to eq(1)
    end

    it 'is taken after a hit' do
      expect(shot.taken).to eq(true)
    end
  end
end
