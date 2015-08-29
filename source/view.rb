module View
  extend self

  def welcome
    puts "Welcome to Flashcards!"
  end

  def game_over
    puts "Game Over!"
  end

  def prompt
    puts "Enter answer: "
  end

  def input
    $stdin.gets
  end

  def question_prompt
    print '>> '
  end

  def console(string)
    puts string
  end
end

