require 'game'

describe 'Game' do
  let(:game) { Game.new }

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
      expect(game.frames[1].first_shot.score).to eq(5)
    end

    it 'updates the frame after bowling the second shot' do
      game.bowl(5)
      game.bowl(2)
      expect(game.frames[1].second_shot.score).to eq(2)
      expect(game.frames[1].score).to eq(7)
    end

    it 'updates the current frame when a frame is completed' do
      2.times { game.bowl(1) }
      expect(game.current_frame.number).to eq(2)
    end

    it 'moves to the next frame after a strike' do
      game.bowl(10)
      expect(game.current_frame.number).to eq(2)
    end

    it 'knows the previous frame' do
      2.times { game.bowl(1) }
      expect(game.pre_frame.number).to eq(1)
    end

    it 'knows the previous previous frame' do
      4.times { game.bowl(1) }
      expect(game.pre_pre_frame.number).to eq(1)
    end

    it 'adds bonus points if the previous frame was a strike' do
      game.bowl(10)
      game.bowl(1)
      game.bowl(1)
      expect(game.frames[1].total).to eq(12)
    end

    it 'adds bonus points if the previous two frames were strikes' do
      2.times { game.bowl(10) }
      2.times { game.bowl(1) }
      expect(game.frames[1].total).to eq(21)
      expect(game.frames[2].total).to eq(12)
    end

    it 'adds bonus points if the previous frame was a spare' do
      game.bowl(9)
      3.times { game.bowl(1) }
      expect(game.frames[1].total).to eq(11)
    end

    it 'updates its total' do
      game.bowl(1)
      game.bowl(2)
      game.bowl(3)
      expect(game.total).to eq(6)
    end

    it 'can bowl a perfect game' do
      12.times { game.bowl(10) }
      expect(game.total).to eq(300)
    end
  end
end
