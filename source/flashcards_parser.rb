
module CardParser
  extend self

  def read_file(filepath)
    array = []
    File.readlines(filepath).each do |line|
      array << line
    end
    array
  end

  def make_cards(file)
    deck = []
    card = {}
    lines_per_card = 3

    read_file(file).each_with_index do |line, index|
      if index % lines_per_card == 0
        card[:definition] = line
      elsif index % lines_per_card == 1
        card[:terms] = line
      elsif index % lines_per_card == 2
        deck << card
        card = {}
        require 'pry'; binding.pry
      end
    end
    deck
  end

end

