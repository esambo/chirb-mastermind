require File.join(File.dirname(__FILE__), "/../spec_helper")

module Mastermind
  describe Game do
    describe "start" do
      let(:messenger) { mock("messenger").as_null_object }
      let(:game)      { Game.new(messenger) }

      it "should send a welcome message" do
        messenger.should_receive(:puts).with("Welcome to Mastermind!")
        game.start(%w[a b c d])
      end

      it "should prompt for the first guess" do
        messenger.should_receive(:puts).with("Enter guess:")
        game.start(%w[a b c d])
      end
    end
  end
end
