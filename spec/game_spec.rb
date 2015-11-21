require 'game'

describe 'Game' do

	context 'when initialised' do
		it 'initialises with the correct amount of frames' do
			test_game = Game.new(10)
			expect(test_game.frames.length).to eq(10)
		end

		it 'knows the current frame is 1' do
			test_game = Game.new(10)
			expect(test_game.current_frame.number).to eq(1)
		end
	end
end
