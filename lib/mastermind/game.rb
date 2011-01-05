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
      (0..@secret.count - 1).each do |i|
        mark += 'b' if @secret[i] == guess[i]
      end
      found_matches = mark.length
      if @secret.include?(guess[2])
        if found_matches == 0
          mark += 'w'
        else
          found_matches -= 1
        end
      end
      @messenger.puts mark
    end
  end
end