
puts 'Welcome to Hangman Game'
puts 'You will get a random word.You have to guess the word.'
puts 'You have to guess one character at a time.You have 5 lives if guess is wrong ,you loss one life.'
puts 'Lets hit the table'

def hangman_game  
  #taking the array  storing dictionary of all words
  words = ['prostitutors', 'ballers', 'depressor', 'akimbo', 'nonoperative', 'scapegrace', 'terrorised', 'corn', 'gentleperson', 'loiterers']
  
  #Selecting rando word from array
  secrete_word  = words.sample
  # puts secrete_word

  #creating a board array filling guesses input
  board = ['_'] * secrete_word.size
  puts board.join(' ')
  lives = 5    #total lifes assigned are 5

  #continue the loop till the end of lives or replacing all "_"
  while lives > 0 && board.include?('_')
    print 'Guess the letter : '
    guess = gets.chomp.downcase
    if secrete_word.include?(guess)
      secrete_word.chars.each_with_index do |ch , index| #finding all indexes where the character appearing
        if ch == guess
          board[index] = ch      #Replacing "_" by character
        end
      end
    else
      lives -= 1
      puts 'Sorry, Wrong input.'
      puts "Lives remain : #{lives}"
    end
    puts board.join(' ')  #printing board of correct  guessed letters
  end

  #condition to match whether the secrete word searched within lives
  if secrete_word == board.join
    puts 'Yooo.....YOU WIN!!!!'
  else
    puts 'Ooono...You Loss!!!...Better LUCK Next Time....'
  end
end

hangman_game


