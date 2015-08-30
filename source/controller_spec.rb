require_relative 'controller'

describe Controller do
  let(:deck) { Deck.new(card) }
  let(:card){ Card.new( term: "and", definition: "A command that appends two or more objects together") }
  let(:control) { Controller.new(deck) }

  describe 'initialize' do
    it 'should contain a Deck object' do
      expect(deck).to be_an_instance_of Deck
    end
  end

  describe 'welcome' do
    it 'should display a message' do
      expect{control.welcome}.to output("Welcome to Flashcards! Enter the term after the definition or 'quit' to end the game. Hit 'enter' to begin.").to_stdout
    end
  end

  describe 'shuffle_card' do
    it 'should shuffle the cards' do
      expect(control.shuffle_card).not_to eql(deck)
    end
  end

  describe 'prompt' do
    it 'should display a small prompt' do
      expect{control.prompt}.to output('>> ').to_stdout
    end
  end

    it 'should display a correct response', :if => true do
      expect { control.guess_response }.to output ('Correct!').to_stdout
    end
    # Not sure on how to write a test for this part



  describe 'quit' do
    it 'should exit the game' do
      expect { raise control.quit }.raise_exception(SystemExit)
    end
  end
end
  # describe 'guess' do
  #   it'should take
  #   output = capture_standard_output { control.guess }
  # expect(output).to eq "Enter Answer: "
  # allow(STDIN).to receive(:gets) { 'alias' }
  # expect(game.ask_for_name).to eq 'alias'
  # end
  # # Could not get user input test to work

