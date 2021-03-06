require_relative 'parser'

describe CardParser do
  let(:cards) { CardParser.read_file('flashcard_samples.txt') }
  let(:new_cards) { CardParser.make_cards('flashcard_samples.txt') }

  describe '#card_parser' do
    it 'should return an Array' do
      expect(cards).to be_an_instance_of Array
    end
  end

  describe '#make_cards' do
    it 'should return an Array' do
      expect(new_cards).to be_an_instance_of Array
    end

    it 'should have Hash objects' do
      expect(new_cards.first).to be_an_instance_of Hash
    end
  end
end
