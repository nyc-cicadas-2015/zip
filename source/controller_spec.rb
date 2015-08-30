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
      expect{ control.welcome }.to output.to_stdout
    end
  end

  describe 'shuffle_card' do
    it 'should shuffle the cards' do
      expect(control.shuffle_card).not_to eql(deck)
    end
  end

  describe 'prompt' do
    it 'should display a small prompt' do
      expect{ control.prompt }.to output('>> ').to_stdout
    end
  end

  describe 'guess_response' do
    it 'should display an incorrect response', :if => true do
      expect { control.guess_response }.to output('Try Again!').to_stdout
    end
  end

  describe 'run_game' do
    it 'should'
  end


  # describe 'quit' do
  #   it 'should exit the game' do
  #     expect {control.game_quit}.to raise_error SystemExit
  #   end
  # end
  # Not sure how to test abort
end
  # describe 'guess' do
  #   it'should take
  #   output = capture_standard_output { control.guess }
  # expect(output).to eq "Enter Answer: "
  # allow(STDIN).to receive(:gets) { 'alias' }
  # expect(game.ask_for_name).to eq 'alias'
  # end
  # # Could not get user input test to work

