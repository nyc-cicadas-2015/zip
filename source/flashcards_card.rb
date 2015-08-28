class Card

  attr_accessor :term, :definition
  def initialize(term,definition)
    @term = term
    @definition = definition
  end

  def questions_ans
  end

  def correct?
  end

  def display
  end

  def guess_counter
  end
end
