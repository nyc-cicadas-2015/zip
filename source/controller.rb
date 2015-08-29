require_relative 'deck'
require_relative 'card'
require_relative 'view'

class Controller
  attr_reader :deck

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

  def guess
    prompt
    @user_guess = View.input
    View.console("\n")
  end

  def correct?
    @card.term == @user_guess
  end

  def quit
    abort("Thanks for playing!")
  end

  def game_over
    View.game_over
  end

  def guess_response
    if correct?
      View.console('Correct!')
    else
      View.console('Try again!')
    end
    View.console("\n")
  end

  def show_question
    View.question_prompt
    View.console("\n")
    View.console @card.definition
    View.console("\n")
  end

  def get_answer?
    @user_guess == "answer"
  end

  def show_answer
    View.console("Answer: " + @card.term)
    View.console
  end

  def run_game!
    welcome
    while !deck.empty?
      shuffle
      show_question
      while !correct?
        guess
        if exit?
          quit
        elsif get_answer?
            show_answer
            break
          end
          guess_response
        end
      end
      game_over
    end
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
