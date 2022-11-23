
puts "Welcome to Hangman Game"
puts "You will get a random word.You have to guess the word."
puts "You have to guess one character at a time.You have 5 lives if guess is wrong ,you loss one life."
puts "Let's hit the table."
def hangman_game
  words = ["mumbai","pune","ahamdabad","banglore","nashik"]

  secrete_word  = words.sample
 # puts secrete_word

  board = ["_"] * secrete_word.size
  puts board.join(" ")
  lives = 5

  while lives > 0 && board.include?("_")
    print "Guess the letter : "
    guess = gets.chomp.downcase
      if secrete_word.include?(guess)
        secrete_word.chars.each_with_index do |ch , index| 
          if ch == guess
            board[index] = ch 
            puts "Good.."
          end
        end
      else
        lives -= 1
        puts "Sorry, Wrong input."
        puts "Lives remain : #{lives}"
     end
     puts board.join(" ")
  end

  if secrete_word == board
    puts "Yooo.....YOU WIN!!!!"
  else
    puts "Ooono...You Loss!!!...Better LUCK Next Time...."
  end
end

hangman_game