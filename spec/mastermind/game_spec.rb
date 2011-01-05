require File.join(File.dirname(__FILE__), "/../spec_helper")

module Mastermind
  describe Game do
    let(:messenger) { mock("messenger").as_null_object }
    let(:game)      { Game.new(messenger) }

    describe '#start' do
      it 'sends a welcome message' do
        messenger.should_receive(:puts).with("Welcome to Mastermind!")
        game.start(%w[a b c d])
      end

      it 'prompt for the first guess' do
        messenger.should_receive(:puts).with("Enter guess:")
        game.start(%w[a b c d])
      end
    end

    describe '#guess' do
      context '0 correct' do
        it 'matches nothing' do
          messenger.should_receive(:puts).with('')
          game.start(%w[r g y c])
          game.guess(%w[w w w w])
        end
      end

      context '1 color correct' do
        it 'matches color and position' do
          messenger.should_receive(:puts).with('b')
          game.start(%w[r g y c])
          game.guess(%w[r w w w])
        end
        
        it 'matches color' do
          messenger.should_receive(:puts).with('w')
          game.start(%w[r g y c])
          game.guess(%w[w w r w])
        end
      end
      
      context '2 colors correct' do
        it 'matches color and position' do
          messenger.should_receive(:puts).with('bb')
          game.start(%w[r g y c])
          game.guess(%w[w g w c])
        end
        
        it 'matches color' do
          messenger.should_receive(:puts).with('ww')
          game.start(%w[r g y c])
          game.guess(%w[g w c w])
        end
      end
    end
  end
end
