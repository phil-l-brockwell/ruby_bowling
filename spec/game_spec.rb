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

    it 'updates the frame after bowling the first shot' do
      game.bowl(5)
      expect(game.frames[1].score).to eq(5)
      expect(game.frames[1].first_shot_score).to eq(5)
    end

    it 'updates the frame after bowling the second shot' do
      game.bowl(5)
      game.bowl(2)
      expect(game.frames[1].second_shot_score).to eq(2)
      expect(game.frames[1].score).to eq(7)
    end

    it 'updates the current frame when a frame is completed' do
      game.bowl(1)
      game.bowl(1)
      expect(game.current_frame.number).to eq(2)
    end
  end
end
