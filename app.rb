require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Laura")
player2 = Player.new("Mathias")

puts "Voici l'état de chaque joueur :"
player1.show_state
puts player2.show_state
life_points = 10

puts 'Et maiiintenant système combaaaaat :'
while player1.life_points >= 0 && player2.life_points >= 0
  player2.attacks(player1)
  player1.show_state
  break if player1.life_points <= 0

  player1.attacks(player2)
  player2.show_state
end
if player1.life_points < player2.life_points
  puts "#{player2.name} a gagné"
else
  puts "#{player1.name} a gagné"
end
binding.pry
