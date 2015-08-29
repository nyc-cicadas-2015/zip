require_relative 'deck'

describe Deck do
  let(:deck){ Deck.new( card ) }
  let(:card){ Card.new( term: "and", definition: "A command that appends two or more objects together") }

  describe 'initialize' do
    it 'should instantiate a deck' do
      expect(deck).to be_an_instance_of Deck
    end
  end

  describe "#shuffle" do
    it 'should shuffle the deck' do
      expect(deck.shuffle).not_to eql deck
    end
  end
end


