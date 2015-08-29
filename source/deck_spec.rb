require_relative 'deck'

describe Deck do
  let(:deck){ Deck.new( CardParser.make_cards('flashcard_samples.txt')) }
  let(:card){ Card.new( term: "and", definition: "A command that appends two or more objects together") }


  describe "#shuffle" do
    it 'should shuffle the deck' do
      expect(deck.shuffle).not_to eql deck
    end
  end

  describe '#definition' do
    it 'should return the definition' do
      expect(deck.definition).to eq(card.definition)
    end
  end

  describe '#term' do
    it 'should return the term' do
      expect(deck.term).to eq(card.term)
    end
  end

  describe '#correct_guess?' do
    it 'should return true if guess = term on card' do
      expect(deck.correct_guess("and")).to eq(card.term)
    end
  end

  # describe '#card_guessed?' do # << WE COULDN'T FIGURE OUT HOW TO TEST FOR THIS!
  #   it 'should push the correctly guessed card into the array of cards guessed' do
  #     expect(deck.card_guessed).to include


  describe '#end_game?' do
    it 'should return an empty array' do
      expect(deck.end_game?).to be_empty
    end
  end
end
