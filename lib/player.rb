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

class HumanPlayer < Player # nouvelle classe pour définir les caractéristiques d'un joueur humain
  attr_accessor :weapon_level # je permets de consulter, lire et modifier simplement le niveau de l'arme

  def initialize(name) # je recrée un initialize et je fais appel aux caractéristiques de la classe mère avec super
    super(name)

    @life_points = 100 # j'ajoute les caractéristiques propres au joueur humain
    @weapon_level = 1
  end

  def show_state # je mets à jour la méthode qui affiche le niveau de vie, seulement pour le joueur humain
    puts "#{@name} a #{@life_points} points de vie et une putain d'arme de niveau #{@weapon_level}"
  end

  def compute_damage # je mets à jour la méthode pour multiplier un chiffre au hasard par le niveau de l'arme
    rand(1..6) * @weapon_level
  end

  def search_weapon # méthode qui permet de partir à la recherche d'une nouvelle arme

    new_weapon = rand(1..6) # définit le niveau de l'arme qui va être trouvée
    puts "Tu as trouvé une arme de niveau #{new_weapon} !"

    if new_weapon > @weapon_level # si le niveau de la nouvelle arme est plus élevé que l'actuelle, la nouvelle arme remplace l'actuelle
      @weapon_level = new_weapon
      puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
    else puts "C'est nul ça, garde ton arme actuelle..."
    end

  end

  def search_health_pack # méthode qui permet de partir à la recherche de points de vie

    health_pack = rand(1..6)
      if health_pack == 1 # méthode if qui définit les conditions pour les différents packs de points de vie en fonction du chiffre sorti au hasard
        puts "Tu n'as rien trouvé..."

      elsif health_pack > 1 && health_pack < 6
        if @life_points >=50 # si le niveau de vie est déjà supérieur ou égal à 50, charger les 100 points
            @life_points = 100
        else
          @life_points = @life_points + 50 # sinon, ajouter 50 points au niveau de vie actuel
        end
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"

      elsif health_pack == 6
        if @life_points >=20 # si le niveau de vie est déjà supérieur ou égal à 20, charger les 100 points
            @life_points = 100
        else
        @life_points = @life_points + 80 # sinon, ajouter 80 points au niveau de vie actuel
        end
        puts "Waow, tu as trouvé un pack de +80 points de vie !"
      end

  end

end
