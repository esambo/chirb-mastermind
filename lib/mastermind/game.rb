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
      @guess = guess
      position_matches = number_of_position_matches
      color_matches = number_of_any_color_matches - position_matches
      @messenger.puts 'b' * position_matches + 
                      'w' * color_matches
    end
    
    def number_of_position_matches
      (0..@secret.count - 1).reduce(0) do |sum, e|
        sum + (@secret[e] == @guess[e] ? 1 : 0)
      end
    end
    
    def number_of_any_color_matches
      secret = @secret
      @guess.reduce(0) do |sum, e|
        sum + (delete_first(secret, e) ? 1 : 0)
      end
    end
    
    def delete_first(secret, e)
      i = secret.index(e)
      secret.delete_at(i) if i
    end
  end
end