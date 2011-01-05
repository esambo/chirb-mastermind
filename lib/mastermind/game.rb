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
      if guess[0] == @secret[0]
        @messenger.puts 'b'
      else
        @messenger.puts ''
      end
    end
  end
end