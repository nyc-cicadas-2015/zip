require 'flashcards_card'
require_relative 'flashcards_parser'

class Deck

  attr_reader :still_left_in_deck, :cards_guessed
  def initialize(deck)
    @cards_guessed = []
    @still_left_in_deck = deck
  end

  def shuffle
    still_left_in_deck.shuffle!
    still_left_in_deck
  end

  def definition
    still_left_in_deck[0].definition
  end

  def term
    still_left_in_deck[1].term
  end

  def correct_guess?(guess)
    guess == still_left_in_deck[1].term
  end

  def card_guessed?
    cards_guessed << still_left_in_deck.first
  end

  def end_game?
    still_left_in_deck.empty?
  end

end



