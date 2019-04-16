require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Jamie")
player2 = Player.new("Randall")

while player1.life_points > 0 && player2.life_points > 0 do

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

  player1.attacks(player2)
  if player2.life_points <= 0 || player1.life_points <=0
    break
  end
  player2.attacks(player1)

end

  puts "
  -----------
  "
