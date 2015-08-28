require_relative 'flashcards_parser'

class Card

  attr_accessor :term, :definition
  def initialize(flashcards= {})
    @term = flashcards[:term]
    @definition = flashcards[:definition]
  end
end
