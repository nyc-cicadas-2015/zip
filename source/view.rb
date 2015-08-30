module View
  extend self

  def welcome
    print "Welcome to Flashcards! Enter the term after the definition or 'quit' to end the game. Hit 'enter' to begin."
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

