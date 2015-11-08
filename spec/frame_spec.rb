require 'frame'

describe 'Frame' do

	let (:frame) { Frame.new }

	context 'when initialised' do

		it 'has a score' do
			expect(frame).to respond_to(:score)
		end

		it 'has a first shot' do
			expect(frame).to respond_to(:first_shot)
		end

		it 'has a second shot' do
			expect(frame).to respond_to(:second_shot)
		end

		it 'is not complete' do
			expect(frame.complete?).to be(false)
		end
	end

	context 'when bowling' do

		it 'can check if it is complete' do
			expect(frame).to respond_to(:complete?)
		end

		it 'can change its status to complete' do
			frame.completed
			expect(frame.complete?).to be(true)
		end

		it 'can receive a bowl' do
			expect(frame).to respond_to(:bowl)
		end

		it 'adds the pins to the first shot' do
			frame.bowl(1)
			expect(frame.first_shot).to eq(1)
		end

		it 'adds the pins to the second shot' do
			frame.bowl(1)
			frame.bowl(2)
			expect(frame.second_shot).to eq(2)
		end
	end
end
