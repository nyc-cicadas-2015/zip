module CardParser
  extend self

  def read_file filepath
    array = []
    File.readlines(filepath).each do |line|
      array << line
    end
    array
  end

  def make_cards file
    deck = []
    card = {}
    lines_per_card = 3

    read_file(file).each_with_index do |line, index|
      if index % lines_per_card == 0
        card[:definition] = line
      elsif index % lines_per_card == 1
        card[:term] = line
      elsif index % lines_per_card == 2
        deck << card
        card = {}
      end
    end
    deck
  end

  # I like the separation of concerns here.  I would take it the last step
  # and have this module actually return an array of Card objects, rather than
  # the data that makes up those cards.
end

