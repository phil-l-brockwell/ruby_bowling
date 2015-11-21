require 'game'

describe 'Game' do

	it 'initialises with the correct amount of frames' do
		test_game = Game.new(10)
		expect(test_game.games.length).to eq(10)
	end
end
