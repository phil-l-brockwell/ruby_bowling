require 'final_frame'

describe 'FinalFrame' do
  context 'when bowling' do
    it 'behaves like a normal frame if it is not a spare/strike' do
      test_frame = FinalFrame.new(10)
      2.times { test_frame.bowl(1) }
      expect(test_frame.total).to eq(2)
      expect(test_frame.complete?).to eq(true)
    end
  end
end
