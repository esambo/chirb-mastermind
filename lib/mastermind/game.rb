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
      if guess[0] == @secret[0]
        mark += 'b'
      elsif @secret.include?(guess[2])
        mark += 'w'
      end
      @messenger.puts mark
    end
  end
end