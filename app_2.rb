require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Quelle est ton blaze jeune pomme ?"
  name = gets.chomp
  player1 = HumanPlayer.new("#{name}")

  player2 = User.new("Bayss")
  player3 = User.new("Mam's")
binding.pry
