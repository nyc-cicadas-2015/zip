require_relative 'deck'
require_relative 'card'
require_relative 'view'
require 'colorize'
require 'artii'

class Controller
  attr_reader :end_game, :card
  attr_accessor :deck, :user_guess
  # include View
  def initialize(deck)
    @deck = deck
    @end_game = false
    @user_guess = ''
    @card = nil

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

  def game_quit
    if @user_guess == "quit\n"
    abort('Bye!'.yellow)
    end
  end

  def guess_response
    if correct?(@card.term)
      View.console('Correct!'.green + "\n")
    else
      View.console('Try Again!'.red + "\n")
    end
  end

   def end_game?
     @end_game
   end

  def guess
    prompt
    @user_guess = View.input
  end

  def correct?(card_answer)
    card_answer == @user_guess
  end


  def run_game
    shuffle_card
    View.welcome
    View.input
    counter = 0
    until @end_game == true
      @card = Card.new(deck[counter])
       puts card.definition
      View.answer_prompt
      guess
      @user_guess
      game_quit
      guess_response
      loop = 1
      while !correct?(@card.term)
        guess
        guess_response
        loop += 1
        if loop == 3
          View.console("The answer is: " + @card.term.green)
          break
        end
      end
       counter += 1
    end
   end
  end
deck = CardParser.make_cards('flashcard_samples.txt')

game = Controller.new(deck)
game.run_game

