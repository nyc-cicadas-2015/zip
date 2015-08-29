require_relative 'card'
require_relative 'parser'

class Deck

  attr_reader :deck
  def initialize(deck)
    @deck = []
    # @still_left_in_deck = deck
  end

  def shuffle
    @deck.shuffle!.pop
  end

  def empty?
    @deck.empty?
  end

end



