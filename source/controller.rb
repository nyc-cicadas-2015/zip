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
      # I would likely make these methods contained within the View
      # itself.  Then your controller calls:
      #
      # View.display_correct
      # or
      # View.display_incorrect
      #
      # Your controller should not be determining how the display is
      # formatted.  What if we want to substitute an HTML display?  If
      # your controller is properly constrained, it should be a simple
      # swap.
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

      # I feel like if I were designing these components, I would like to be able
      # to do something like:
      #
      # guess = View.ask_question(@card)
      # if @card.correct_answer?(guess)
      # else
      # end

      # The Card object should know how to check if the answer provided is correct
      # The View object should be responsible for anything input/output related
      # (in relation to the user)
      # The Controller's job is simply to manage program flow between the objects
      #
      game_quit
      guess_response
      loop = 1
      while !correct?(@card.term)
      # I would love to see this loop look like:
      #
      # until @card.correct?(View.prompt_user(@card)) or loop >= 3
      # ...
      # end
      #
      # Or something similar to that
      #
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

  # It seems like you never actually use your Deck object.  Your parser returns
  # and array of hashes, which you then use to instantiate a Card object within
  # your class.  The CardParser should return an array of Card objects, which you
  # can then pass to your Deck object, which can then be used within your controller:
  #
  # cards = CardParser.make_cards('flashcard_samples.txt')
  # deck = Deck.new(cards)
  # game = Contoller.new(deck)
  # game.run_game
  # ...
  #
  # You defined the proper objects/classes, but it does not seem as though you
  # utilized them properly.
  #
deck = CardParser.make_cards('flashcard_samples.txt')

game = Controller.new(deck)
game.run_game

