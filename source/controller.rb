require_relative 'deck'
require_relative 'card'

class Controller
  include CardParser
  include View

  def initialize(filepath)
    @deck = Deck.new(CardParser.make_cards('flashcard_samples.txt'))
  end

  def welcome
    View.welcome
  end

#   def run_game
#     puts View.welcome #welcome message
#       sleep 0.1
#     puts View.rules #instructions on the game
#       sleep 0.1
#   5.times do
#     until deck.end_game?
#       # puts view.definition #definition of the card
#       puts deck.definition
#         sleep 0.5
#       puts view.guess
#       puts deck.correct?(gets.chomp.downcase) # does the term equal the guess
#         sleep 0.1
#     end
#   end
#   deck.card_guessed?
# end



end
