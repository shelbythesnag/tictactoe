load 'display.rb'
load 'CLI-helperfunctions.rb'

class Game
    def initialize
        a = playersetup(setupfirstplayer)
        b = playersetup(setupsecondplayer(a))
        bansametoken(a,b)

        newgame = Board.new
        turn = turn_count(newgame.cells,a.token,b.token)

        winningcombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        game_over = false

        while game_over == false
            display_turn(turn_count(newgame.cells,a.token,b.token))
            turn(newgame,current_player(newgame.cells,a,b))
            game_over = newgame.allcombo_winchecker(winningcombinations,newgame.cells).any?(true) || newgame.check_tiegame(newgame.cells) ? true : false
        end

    newgame.check_tiegame(newgame.cells) ? tiegame : displaygamewinner(last_player(newgame.cells,a,b).name)
    end
end

class Player
    attr_accessor :name,:token, :turn
    def initialize (name,token,turn)
        @name = name
        @token = token
        @turn = turn
    end
end

class Board
    attr_accessor :cells
    def initialize
        @cells = [1,2,3,4,5,6,7,8,9]
    end
    def update_board(position,token)
        cells[position-1]=token
    end
    def checkvalidmove(position)
        cells[position-1].class==Integer ? true : false
    end
    def individual_winchecker(individualcombinations,boardstate)
        individualcombinations.each.map do |position|
            boardstate[position]
        end
    end
    def allcombo_winchecker(allcombos,boardstate)
        allcombos.each.map do |combos|
            individual_winchecker(combos,boardstate).uniq.size == 1
        end
    end 
    def check_tiegame(boardstate)
        boardstate.all? {|spaces| spaces.class == String}
    end
end

