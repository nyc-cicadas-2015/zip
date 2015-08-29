require_relative 'deck'
require_relative 'card'
require_relative 'view'

class Controller
  attr_reader :deck
  # include CardParser
  # include View

  def initialize deck
    @deck = deck
  end

  def welcome
    View.welcome
  end

  def shuffle_card
    @card = deck.shuffle
  end

  def prompt
    View.question_prompt
  end

  def prompt
    View.answer_prompt
  end

  def guess
    prompt
    @user_guess = View.input
    View.console("\n")
  end

  def correct?
    @card.term == @user_guess
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

