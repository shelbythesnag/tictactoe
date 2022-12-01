#player setup
def player1or2
    puts "is this player 1 or 2?"
    x = gets.chomp.to_i
    check_validinput_1or2(x)? x : loopuntil_validinput_1or2(x)
end

def createname(player)
    puts "what's #{player}'s name?"
    return gets.chomp.to_s
end

def createtoken(player)
    puts "what's #{player}'s token?"
    t = gets.chomp
    check_validinput_atoz(t)? t : loopuntil_validinput_atoz(t)
end

#board
def displaygameboard(celldata)
    puts ' '+celldata[0].to_s+' | '+celldata[1].to_s+' | '+celldata[2].to_s+' '"\n"' --+---+---'"\n"' '+celldata[3].to_s+' | '+celldata[4].to_s+' | '+celldata[5].to_s+' '"\n"' --+---+---'"\n"' '+celldata[6].to_s+' | '+celldata[7].to_s+' | '+celldata[8].to_s+' '"\n"
end

#turn prompt
def display_turn(num)
    puts "Turn: #{num}"
end

def get_position_input(player)
    puts player.name + " it's your turn, choose a position to place your token"
    y = gets.chomp.to_i
    check_validinput_1to9(y)? y : loopuntil_validinput_1to9(y)
end


#invalid/error messages
def invalidtokenmessage(token)
    puts "#{token} has already been selected, please select a SINGLE character between 'A' to 'Z', can be upper or lower case"
end

def invalidpositionmessage(position)
    puts "#{position} has already been selected, please refer to board and select another position"
end

#invalid input loop
def loopuntil_validinput_1to9(input)
    loop do 
        puts "invalid input, please select a number from 1-9"
        input = gets.chomp.to_i
        break if check_validinput_1to9(input) == true
    end
    return input
end

def loopuntil_validinput_1or2(input)
    loop do 
        puts "invalid input, please select 1 or 2"
        input = gets.chomp.to_i
        break if check_validinput_1or2(input) == true
    end
    return input
end

def loopuntil_validinput_atoz(input)
    loop do 
        puts "invalid input, please select a SINGLE character between 'A' to 'Z', can be upper or lower case"
        input = gets.chomp
        break if check_validinput_atoz(input) == true
    end
    return input
end

#end game prompts
def tiegame
    puts "TIE GAME"
end

def displaygamewinner(player)
    puts "the winner of the game is " + player
end

def replaymessage
    puts "Would you like to play again? (press 'n' closes the game, anything else restarts!)"
end