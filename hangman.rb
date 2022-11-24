
puts "Welcome to Hangman Game"
puts "You will get a random word.You have to guess the word."
puts "You have to guess one character at a time.You have 5 lives if guess is wrong ,you loss one life."
puts "Let's hit the table."
def hangman_game
  #taking the array for storing dictionary of all words
  words = ["mumbai","pune","ahamdabad","banglore","nashik"]

  #Selecting rando word from array
  secrete_word  = words.sample
 # puts secrete_wordP

 #creating a board array for filling guesses input
  board = ["_"] * secrete_word.size
  puts board.join(" ")
  lives = 5

  #loop for guessing letters and filling to appropriate  position
  while lives > 0 && board.include?("_")
       print "Guess the letter : "
       guess = gets.chomp.downcase
       if secrete_word.include?(guess)     #checking guessed letter in word or not
          secrete_word.chars.each_with_index do |ch , index|   #loop for positioning the guessed character at perticular position
            if ch == guess
               board[index] = ch      
            end
          end
       else
          lives -= 1
          puts "Sorry, Wrong input."
          puts "Lives remain : #{lives}"
       end
       puts board.join(" ")  #printing board of correct  guessed letters
  end

  #condition to match whether the secrete word searched within lives
  if secrete_word == board.join
     puts "Yooo.....YOU WIN!!!!"
  else
     puts "Ooono...You Loss!!!...Better LUCK Next Time...."
  end
end

hangman_game
