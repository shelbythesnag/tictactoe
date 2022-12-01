load 'display.rb'
load 'game-generator.rb'
load 'CLI-helperfunctions.rb'
load 'gameplay.rb'

loop do
    Game.new
    replaymessage
    break if gets.chomp.to_s == 'n'
end

