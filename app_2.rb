require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Quelle est nom jeune pomme ?"
  name = gets.chomp
  player = HumanPlayer.new("#{name}")
  puts "#{name} il est temps pour toi de prouver ta valeur jeune pandawan"
  puts "\n"

  bots1 = Player.new("Bayss")
  bots2 = Player.new("Mam's")

  @enemies = []
  @enemies << bots1 #Permet de mettre ses bots dans l'array
  @enemies << bots2

  while player.life_points > 0 && (bots1.life_points > 0 || bots2.life_points > 0)
    player.show_state
    #bots1.show_state
    #bots2.show_state
    puts "\n" #Nous permet d'avoir des saut a la ligne
    puts "Que veut tu faire maintenant ?"
    puts "a - Chercher une meilleure arme"
    puts "s - Chercher du soin"
    puts "\n"
    puts "Attaquer un joueur en vue :"
    print "0 - Pour "
    print bots1.show_state
    print "1 - Pour "
    print bots2.show_state
    print "> "
    choice = gets.chomp
    if choice == "a"
      player.search_weapon
    elsif choice == "s"
      player.search_health_pack
      player.show_state
    elsif choice == "0"
      player.attacks(bots1)
    elsif choice == "1"
      player.attacks(bots2)
    end
    if player.life_points > 0 && (bots1.life_points > 0 || bots2.life_points > 0)
    puts ""
    puts "Touts les joueurs t'attaque"
    end
    @enemies.each do |enemy|
      if @enemies.life_points <= 0
        break
      end
    end
    @enemies.attacks(player)
    if player.life_points <= 0
      break
    end
    puts ""
    puts "La partie est finie"
      if player.life_points == 0
        puts "Loser ! Tu as perdu !"
      else
        puts "BRAVO ! TU AS GAGNE !"
      end
    end
#binding.pry
