module Mastermind
  class Game
    def initialize(messenger)
      @messenger = messenger
    end
    
    def start(secret_code)
      @secret = secret_code
      @messenger.puts "Welcome to Mastermind!"
      @messenger.puts "Enter guess:"
    end
    
    def guess(guess)
      mark = ''
      color_matches = number_of_color_matches(guess)
      mark += 'b' * color_matches
      
      any_matches = 0
      if @secret.include?(guess[2])
        any_matches += 1
        mark += 'w' * (any_matches - color_matches)
      end
      @messenger.puts mark
    end
    
    def number_of_color_matches(guess)
      sum = 0
      (0..@secret.count - 1).each do |i|
        sum += 1 if @secret[i] == guess[i]
      end
      sum
    end
  end
end