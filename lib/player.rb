class Player
  attr_accessor :name, :life_points

  def initialize(player_name, life = 10)
    @name = player_name
    @life_points = life
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    damage = damage.to_i
    @life_points = life_points - damage
  end

  def attacks(second_player)
    attack_damage = compute_damage
    puts "#{@name} attaque #{second_player.name}"
    second_player.gets_damage(attack_damage)
    puts "Il lui inflige #{attack_damage} points de dommages"

  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(player_name, player_life = 100, weapon_level = 1)
    @name = player_name
    @life_points = player_life
    @weapon = weapon_level
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon}"
  end

  def compute_damage
    rand(1..6) * @weapon
  end

  def search_weapon
    weapon_found = rand(1..6)
    puts "Tu a trouvé une arme de niveau #{weapon_found}"
    if weapon_found < @weapon
      puts "Chacal t'es tombé sur de la merde"
    else weapon_found = @weapon
      puts "Ouaiiiis cette arme est bien plus puissante que la tienne, prend la"
    end
  end

  def search_health_pack
    health_found = rand(1..6)
    if health_found == 1
    puts "Tu n'a rien trouvé"
    if health_found > 2 && health_found < 5
    @life_points = @life_points + 50
    puts "Bravo, t'a trouvé 50 HP"
    if health_found == 6
    @life_points = @life_points + 80
    puts "SUUUPER tu viens de choper 80 HP"
    if @life_points > 100
      @life_points == 100
    end
    end
    end
    end
  end
end
