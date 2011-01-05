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
      position_matches = number_of_position_matches(guess)
      any_matches = number_of_any_color_matches(guess)
      mark = 'b' * position_matches + 
             'w' * (any_matches - position_matches)
      @messenger.puts mark
    end
    
    def number_of_position_matches(guess)
      (0..@secret.count - 1).reduce(0) do |sum, e|
        sum + (@secret[e] == guess[e] ? 1 : 0)
      end
    end
    
    def number_of_any_color_matches(guess)
      guess.reduce(0) do |sum, e|
        sum + (@secret.include?(e) ? 1 : 0)
      end
    end
  end
end