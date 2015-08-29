module View
  extend self

  def welcome
    print "Welcome to Flashcards!"
  end

  def game_over
    print "Game Over!"
  end

  def answer_prompt
    print "Enter answer: "
  end

  def input
    $stdin.gets
  end

  def question_prompt
    print '>> '
  end

  def console string
    print string
  end

end
