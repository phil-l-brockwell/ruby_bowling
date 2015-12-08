require 'final_frame'

describe 'FinalFrame' do
  context 'when bowling' do
  	it 'is not complete if the first shot is a strike' do
  		frame = FinalFrame.new(10)
  		frame.bowl(10)
  		expect(frame.complete?).to be(false)
  	end
  end
end
