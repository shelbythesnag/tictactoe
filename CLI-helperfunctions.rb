def check_validinput_1or2(input)
    input == 1 || input == 2 ? true : false
end

def check_validinput_1to9(input)
    input == 1 || input == 2 || input == 3 || input == 4 ||input == 5 || input == 6 ||input == 7 || input == 8 || input == 9 ? true : false
end

def check_validinput_atoz(input)
    (input.ord > 64 && input.ord < 123)&& input.size == 1 ? true : false
end

#conditional - can update board.

def turnorderloop(counter)
    if counter % 2 == 1
        currentplayer = 'Player 1'
    else
        currentplayer = 'Player 2'
    end
end

#conditional - Player 1 or Player 2 setup
def setupfirstplayer
    if player1or2 == 1
        return 'Player 1'
    else 
        return 'Player 2'
    end
end

def setupsecondplayer (player)
    if player.turn == 1
        setup = 'Player 2'
    else   
        setup = 'Player 1'
    end
end

def bansametoken (playera,playerb)
    if playera.token == playerb.token
        while playera.token == playerb.token do
            invalidtokenmessage(playerb.token)
            playerb.token = gets.chomp.to_s
            check_validinput_atoz(playerb.token)? playerb.token : loopuntil_validinput_atoz(playerb.token)
        end
        return playerb.token
    else
        puts "Let the game begin!"
    end
end