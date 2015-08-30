require_relative 'deck'
require_relative 'card'
require_relative 'view'

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

  def game_status
    if @user_guess == "quit\n"
    abort('Bye!')
     @end_game = true #this is pointless, but we need to keep the loop in run_game
    end
  end
  def guess_response
     case correct?(@card.term)
        when true
        View.console("Correct!")
        else
          View.console("Wrong!")
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

    puts View.welcome #welcome message
    sleep 0.1
    View.input
    counter = 0
    until @end_game == true
      @card = Card.new(deck[counter])
       puts card.definition
        sleep 0.1
      View.answer_prompt
      guess
      @user_guess
      counter += 1
      game_status
      guess_response
        sleep 0.1
    end
   end
  end
deck = CardParser.make_cards('flashcard_samples.txt')
 # thing = Card.new(deck)

 game = Controller.new(deck)
   # game.run_game

