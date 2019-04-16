require 'pry'

class Player # je crée ma classe Player que je vais définir

  attr_accessor :name, :life_points # je permets de consulter, lire et modifier simplement le nom et le niveau de vie

  def initialize(name) # j'initialise les données qui doivent être ajoutées en même temps que la création du player
    @name = name # le nom du joueur
    @life_points = 10 # le niveau de vie de départ
  end

  def show_state # méthode qui affiche le niveau de vie actuel d'un joueur
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(number) # méthode qui soustrait les dommages infligés au niveau de vie actuel
    @life_points = @life_points - number
      if @life_points <=0
        puts "#{@name} a succombé à ses blessures !"
      end
  end

  def attacks(player) # méthode qui permet à un joueur d'infliger des dommages à un autre joueur
    puts "#{@name} attaque #{player.name}"
    number = compute_damage
    puts "Il lui inflige #{number} points de dommage"
    player.gets_damage(number)

  end

    def compute_damage # méthode qui sort au hasard un chiffre entre 1 et 6
       return rand(1..6)
    end

end
