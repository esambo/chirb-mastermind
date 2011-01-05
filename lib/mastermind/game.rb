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

      position_matches = number_of_position_matches(guess)
      mark += 'b' * position_matches
      
      any_matches = number_of_any_color_matches(guess)
      mark += 'w' * (any_matches - position_matches)

      @messenger.puts mark
    end
    
    def number_of_position_matches(guess)
      sum = 0
      (0..@secret.count - 1).each do |i|
        sum += 1 if @secret[i] == guess[i]
      end
      sum
    end
    
    def number_of_any_color_matches(guess)
      any_matches = 0
      guess.each do |e|
        if @secret.include?(e)
          any_matches += 1
        end
      end
      any_matches
    end
  end
end