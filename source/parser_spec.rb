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

# describe Deck do
#   let(:deck){Deck.new(CardParser.make_cards('flashcard_samples.txt'))}
#   let(:card){Card.new(term:"and" definition:"A command that appends two or more objects together")}

#   describe "#shuffle" do
#     it 'should shuffle the deck' do
#       expect(deck.shuffle).to be_a(Array)
#     end
#   end

#   describe '#definition' do
#     it 'should return the definition' do
#       expect(deck.definition).to eq(card.definition)
#     end
#   end

#   describe '#term' do
#     it 'should return the term' do
#       expect(deck.term).to eq(card.term)
#     end
#   end

#   describe '#correct_guess?' do
#     it 'should return true if guess = term on card' do
#       expect(deck.correct_guess("and")).to eq(card.term)
#     end
#   end

#   # describe '#card_guessed?' do # << WE COULDN'T FIGURE OUT HOW TO TEST FOR THIS!
#   #   it 'should push the correctly guessed card into the array of cards guessed' do
#   #     expect(deck.card_guessed).to include


#   describe '#end_game?' do
#     it 'should return an empty array' do
#       expect(deck.end_game?).to be_empty
#     end
#   end
# end
