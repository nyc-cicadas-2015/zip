require_relative 'flashcards_deck'
require_relative 'flashcards_card'

class Controller
  include CardParser

def initialize(filepath)
  deck = Deck.new(CardParser.make_cards('flashcard_samples.txt'))
end

def run_game
  puts view.welcome #welcome message
    sleep 0.1
  puts view.rules #instructions on the game
    sleep 0.1
  5.times do
    until deck.end_game?
      puts view.definition #definition of the card
      puts deck.definition
        sleep 0.5
      puts view.guess
      puts deck.correct?(gets.chomp.downcase) # does the term equal the guess
        sleep 0.1
    end
  end
  deck.card_guessed? #
end



end
