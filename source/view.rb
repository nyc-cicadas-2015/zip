module View
  extend self

  def welcome
    title = Artii::Base.new
    print '*' * 83
    print "\n"
    print title.asciify('Ruby Flashcards!').blue
    print "\n"
    print "Enter the term after the definition or " + "'quit' ".red + "to end the game. Hit " + "'enter' ".green + "to begin."
    print "\n"
    print '*' * 83
  end

  def game_over
    print "Game Over!"
  end

  def answer_prompt
    print "Enter answer: "
  end

  def input
    gets
  end

  def question_prompt
    print '>> '
  end

  def console(string)
    print string
  end
end

