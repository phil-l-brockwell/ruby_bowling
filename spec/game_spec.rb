require 'game'

describe 'Game' do
  let(:game) { Game.new(10) }

  context 'when initialised' do
    it 'initialises with the correct amount of frames' do
      expect(game.frames.length).to eq(10)
    end

    it 'knows the current frame is 1' do
      expect(game.current_frame.number).to eq(1)
    end
  end

  context 'when bowling' do
    it 'can check the score of a frame' do
      expect(game.frames[1].score).to eq(0)
    end

    # it 'updates the score of a frame after bowling' do
    #   game.bowl(5)
    #   expect(game.frames[1].score).to eq(5)
    # end
  end
end
