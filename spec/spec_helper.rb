$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require "bundler/setup"
require 'rubygems'
require 'spork'

Spork.prefork do
  require 'rspec'
end

Spork.each_run do
  require 'mastermind'
end
