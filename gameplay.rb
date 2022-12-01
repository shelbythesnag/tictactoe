load 'display.rb'
load 'game-generator.rb'
load 'CLI-helperfunctions.rb'


def playersetup(player)
    a = player.to_s
    x = createname(a)
    y = createtoken(a)
    z = (a == 'Player 1' ? 1 : 2)
    return Player.new(x,y,z)
end 

def turn(newgame,player)
    displaygameboard(newgame.cells)
    a = get_position_input(player)
    newgame.checkvalidmove(a)
    newgame.update_board(a,player.token)
end

def turn_count(board,token1,token2)
    counter = 1
    board.each do |spaces|
        if spaces.class == String
            counter += 1
        end
    end
    counter
end

def current_player(board,playera,playerb)
    turn_count(board,playera.token,playerb.token)%2 == 1 ? playera : playerb
end

def last_player(board,playera,playerb)
    turn_count(board,playera.token,playerb.token)%2 == 0 ? playera : playerb
end

winningcombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

