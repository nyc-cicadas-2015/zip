require_relative 'card'
require_relative 'parser'

class Deck
  include CardParser
  attr_reader :deck

  def initialize(deck)
    @deck = []
    @import_cards = read_file(filepath)
    @import_cards.each { |card| @deck << Card.new(card) }
  end

  def shuffle
    @deck.shuffle!.pop
  end

  def empty?
    @deck.empty?
  end

end
