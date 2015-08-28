module View
  extend self

  def welcome_msg
    puts "Welcome to Flashcards!"
  end

  def game_over_msg
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

View.welcome_msg
View.game_over_msg
