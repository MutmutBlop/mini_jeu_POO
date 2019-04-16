require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player' # fait appel aux classes Player et HumanPlayer

player1 = Player.new("Jamie") # création des deux ennemis
player2 = Player.new("Randall")

while player1.life_points > 0 && player2.life_points > 0 do # jusqu'à ce que l'un des joueurs perde tous ses points, le jeu tourne et ils s'affrontent tour après tour

  puts "
  -----------
  "

  puts "Voici l'état de chaque joueur :"
  player1.show_state
  player2.show_state

  puts "
  ---
  "

  puts "Passons au duel :"

  player1.attacks(player2) # le joueur 1 attaque en premier
  if player2.life_points <= 0 # si le joueur 2 meurt, il ne peut plus faire une dernière attaque sur le joueur 1
    break
  end
  player2.attacks(player1) # le joueur 2 attaque à son tour

end

  puts "
  -----------
  "
