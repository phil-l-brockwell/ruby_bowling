require 'shot'

describe 'Shot' do
  let(:shot) { Shot.new }

  context 'when initialised' do
    it 'is not complete' do
      expect(shot.complete).to eq(false)
    end
  end

  context 'when bowling' do
    before { shot.hit(1) }

    it 'can update its score' do
      expect(shot.score).to eq(1)
    end

    it 'is complete after a hit' do
      expect(shot.complete).to eq(true)
    end
  end
end
