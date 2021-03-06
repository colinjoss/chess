class Pawn
    attr_accessor :name, :player, :color, :uni, :x, :y, :destination, :capturing, :moveset
    def initialize(player, color, x, y)
        @name = "pawn"
        @player = player
        @color = color
        color == "white" ? (@uni = "\u265F") : (@uni = "\u2659")
        @x = x
        @y = y
        @destination = nil
        @capturing = nil
        @moveset = [ [-1,1], [1,1], [0,1], [0,2] ]
    end
end

class Rook
    attr_accessor :name, :player, :color, :uni, :x, :y, :destination, :capturing, :moveset
    def initialize(player, color, x, y)
        @name = "rook"
        @player = player
        @color = color
        color == "white" ? (@uni = "\u265C") : (@uni = "\u2656")
        @x = x
        @y = y
        @destination = nil
        @capturing = nil
        @moveset = [ 
            [0,1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7],
            [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0],
            [0,-1], [0,-2], [0,-3], [0,-4], [0,-5], [0,-6], [0,-7],
            [-1,0], [-2,0], [-3,0], [-4,0], [-5,0], [-6,0], [-7,0]
        ]
    end
end

class Knight
    attr_accessor :name, :player, :color, :uni, :x, :y, :destination, :capturing, :moveset
    def initialize(player, color, x, y)
        @name = "knight"
        @player = player
        @color = color
        color == "white" ? (@uni = "\u265E") : (@uni = "\u2658")
        @x = x
        @y = y
        @destination = nil
        @capturing = nil
        @moveset = [ [1,2], [2,1], [2, -1], [1, -2], [-2, 1], [-1, 2], [-1, -2], [-2, -1] ]
    end
end

class Bishop
    attr_accessor :name, :player, :color, :uni, :x, :y, :destination, :capturing, :moveset
    def initialize(player, color, x, y)
        @name = "bishop"
        @player = player
        @color = color
        color == "white" ? (@uni = "\u265D") : (@uni = "\u2657")
        @x = x
        @y = y
        @destination = nil
        @capturing = nil
        @moveset = [ 
            [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7],
            [1,-1], [2,-2], [3,-3], [4,-4], [5,-5], [6,-6], [7,-7],
            [-1,-1], [-2,-2], [-3,-3], [-4,-4], [-5,-5], [-6,-6], [-7,-7],
            [-1,1], [-2,2], [-3,3], [-4,4], [-5,5], [-6,6], [-7,7]
        ]
    end
end

class Queen
    attr_accessor :name, :player, :color, :uni, :x, :y, :destination, :capturing, :moveset
    def initialize(player, color, x, y)
        @name = "queen"
        @player = player
        @color = color
        color == "white" ? (@uni = "\u265A") : (@uni = "\u2654")
        @x = x
        @y = y
        @destination = nil
        @capturing = nil
        @moveset = [ 
            [0,1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7],
            [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7],
            [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0],
            [1,-1], [2,-2], [3,-3], [4,-4], [5,-5], [6,-6], [7,-7],
            [0,-1], [0,-2], [0,-3], [0,-4], [0,-5], [0,-6], [0,-7],
            [-1,-1], [-2,-2], [-3,-3], [-4,-4], [-5,-5], [-6,-6], [-7,-7],
            [-1,0], [-2,0], [-3,0], [-4,0], [-5,0], [-6,0], [-7,0],
            [-1,1], [-2,2], [-3,3], [-4,4], [-5,5], [-6,6], [-7,7]
        ]
    end
end

class King
    attr_accessor :name, :player, :color, :uni, :x, :y, :destination, :capturing, :moveset, :check
    def initialize(player, color, x, y)
        @name = "king"
        @player = player
        @color = color
        color == "white" ? (@uni = "\u265B") : (@uni = "\u2655")
        @x = x
        @y = y
        @destination = nil
        @capturing = nil
        @moveset = [ [-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1] ]
        @check = [ 
            [0,1], [0,2], [0,3], [0,4], [0,5], [0,6], [0,7],
            [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7],
            [1,0], [2,0], [3,0], [4,0], [5,0], [6,0], [7,0],
            [1,-1], [2,-2], [3,-3], [4,-4], [5,-5], [6,-6], [7,-7],
            [0,-1], [0,-2], [0,-3], [0,-4], [0,-5], [0,-6], [0,-7],
            [-1,-1], [-2,-2], [-3,-3], [-4,-4], [-5,-5], [-6,-6], [-7,-7],
            [-1,0], [-2,0], [-3,0], [-4,0], [-5,0], [-6,0], [-7,0],
            [-1,1], [-2,2], [-3,3], [-4,4], [-5,5], [-6,6], [-7,7]
        ]
    end
end

class Tile 
    attr_accessor :uni
    def initialize(uni)    
        @uni = uni
    end
end

class ChessBoard
    attr_accessor :chess
    def initialize
        @chess = create_coordinates
    end

    def create_coordinates
        array = []
        counter = 0
        (1..9).each do |x|
            if x == 1
                array << " "
                next 
            end
            x = []
            (1..9).each do |y|
                if y == 1
                    y = " " 
                else
                    counter % 2 == 0 ? (y = Tile.new("\u25A0")) : (y = Tile.new("\u25A1"))
                end
                counter += 1
                x << y
            end
            array << x
        end
        return array
    end

    def show
        puts "
          a b c d e f g h
        8 #{@chess[1][8].uni} #{@chess[2][8].uni} #{@chess[3][8].uni} #{@chess[4][8].uni} #{@chess[5][8].uni} #{@chess[6][8].uni} #{@chess[7][8].uni} #{@chess[8][8].uni} 8
        7 #{@chess[1][7].uni} #{@chess[2][7].uni} #{@chess[3][7].uni} #{@chess[4][7].uni} #{@chess[5][7].uni} #{@chess[6][7].uni} #{@chess[7][7].uni} #{@chess[8][7].uni} 7
        6 #{@chess[1][6].uni} #{@chess[2][6].uni} #{@chess[3][6].uni} #{@chess[4][6].uni} #{@chess[5][6].uni} #{@chess[6][6].uni} #{@chess[7][6].uni} #{@chess[8][6].uni} 6
        5 #{@chess[1][5].uni} #{@chess[2][5].uni} #{@chess[3][5].uni} #{@chess[4][5].uni} #{@chess[5][5].uni} #{@chess[6][5].uni} #{@chess[7][5].uni} #{@chess[8][5].uni} 5
        4 #{@chess[1][4].uni} #{@chess[2][4].uni} #{@chess[3][4].uni} #{@chess[4][4].uni} #{@chess[5][4].uni} #{@chess[6][4].uni} #{@chess[7][4].uni} #{@chess[8][4].uni} 4
        3 #{@chess[1][3].uni} #{@chess[2][3].uni} #{@chess[3][3].uni} #{@chess[4][3].uni} #{@chess[5][3].uni} #{@chess[6][3].uni} #{@chess[7][3].uni} #{@chess[8][3].uni} 3
        2 #{@chess[1][2].uni} #{@chess[2][2].uni} #{@chess[3][2].uni} #{@chess[4][2].uni} #{@chess[5][2].uni} #{@chess[6][2].uni} #{@chess[7][2].uni} #{@chess[8][2].uni} 2
        1 #{@chess[1][1].uni} #{@chess[2][1].uni} #{@chess[3][1].uni} #{@chess[4][1].uni} #{@chess[5][1].uni} #{@chess[6][1].uni} #{@chess[7][1].uni} #{@chess[8][1].uni} 1
          a b c d e f g h
        "
    end

end

class ChessGameFlow
    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @white_tokens = []
        @black_tokens = []
        @captured_by_white = []
        @captured_by_black = []
        @player_order = []    
        @move_log = []
        @white_king = nil
        @black_king = nil
        @check = false
        @escape_check = []
        @board = ChessBoard.new
        @board.show
        self.start_up
    end

    def start_up
        pick_first
        create_tokens(@player_order[0], @white_tokens, "white")
        create_tokens(@player_order[1], @black_tokens, "black")
        @all_tokens = @white_tokens + @black_tokens
        place_tokens
        @board.show
        game_cycle
    end

    def pick_first
        loop do
            puts "Who's going first, #{@player1.name} or #{@player2.name}?"
            answer = gets.chomp
            if answer == @player1.name 
                @player_order = [@player1, @player2]
                @player1.color = "white"
                @player2.color = "black"
                break
            elsif answer == @player2.name 
                @player_order = [@player2, @player1]
                @player1.color = "black"
                @player2.color = "white"
                break
            else
                puts "Sorry, I don't understand. Try that again."
            end
        end
        puts "Okay, #{@player_order[0].name} is going first."
    end

    def create_tokens(player, tokens, color)
        if color == "white" 
            x = 1
            y = 2
        else
            x = 1
            y = -7
        end
        (0..8).each do |i|
            tokens[i] = Pawn.new(player, color, x+i, y.abs)
        end
        tokens[8] = Rook.new(player, color, x, (y-1).abs)
        tokens[9] = Rook.new(player, color, x+7, (y-1).abs)
        tokens[10] = Knight.new(player, color, x+1, (y-1).abs)
        tokens[11] = Knight.new(player, color, x+6, (y-1).abs)
        tokens[12] = Bishop.new(player, color, x+2, (y-1).abs)
        tokens[13] = Bishop.new(player, color, x+5, (y-1).abs)
        tokens[14] = Queen.new(player, color, x+3, (y-1).abs)
        tokens[15] = King.new(player, color, x+4, (y-1).abs)
        color == "white" ? (@white_king = tokens[15]) : (@black_king = tokens[15])
    end

    def place_tokens
        @white_tokens.each do |token|
            @board.chess[token.x][token.y] = token
        end
        @black_tokens.each do |token|
            @board.chess[token.x][token.y] = token
        end
    end

    def game_cycle
        puts "LET'S PLAY CHESS"
        turn_count = 0
        @game_over = false
        while !@game_over
            turn_count += 1
            player = next_player(turn_count)
            puts("Your king is in check - you must save your King!") if @check
            puts "Your turn, #{player.name}."
            token = validate_move(player)
            add_to_log(token)
            capture_enemy(token)
            @check = false
            @escape_check = []
            move_token(token)
            checkmate?(token) if @check
            show_captured_by_black
            @board.show
            show_captured_by_white
            wipe_all_tokens
        end
    end

    def checkmate?(token)
        token.color == "white" ? (king = @black_king) : (king = @white_king)
        x = king.x
        y = king.y
        king_escape?(king)
        king.x = x
        king.y = y
        king.destination = nil
        capture_threat?(king, token)
        block_threat?(king, token)
        puts @escape_check
        return if @escape_check.length > 0
        game_over(token)
    end

    def king_escape?(king)
            x = king.x
            y = king.y
        king.moveset.each do |destination|
            king.x = x
            king.y = y
            king.destination = [king.x + destination[0], king.y + destination[1]]
            next if king.destination[0] < 1 || king.destination[0] > 8
            next if king.destination[1] < 1 || king.destination[1] > 8
            other_token = token_on_coord?(king.destination)
            if !!other_token
                next if same_team?(king, other_token) == true
            end
            king.x = king.destination[0]
            king.y = king.destination[1]
            next if adjacent_threat?(king) || knight_threat?(king) || horz_vert_threat?(king) || diagonal_threat?(king)
            @escape_check << [king, king.destination]
        end
    end

    def capture_threat?(king, threat)
        @all_tokens.each do |token|
            next if token.color != king.color
            token.destination = [threat.x, threat.y]
            if token.is_a?(Pawn)
                @escape_check << [token, token.destination] if pawn_move_possible?(token)
            elsif token.is_a?(Rook)
                @escape_check << [token, token.destination] if rook_move_possible?(token)
            elsif token.is_a?(Knight)
                @escape_check << [token, token.destination] if knight_move_possible?(token)
            elsif token.is_a?(Bishop)
                @escape_check << [token, token.destination] if bishop_move_possible?(token)
            elsif token.is_a?(Queen)
                @escape_check << [token, token.destination] if queen_move_possible?(token)
            end     
        end
    end

    def block_threat?(king, threat)
        coord = nil
        if threat.x == king.x && threat.y != king.y
            threat.y > king.y ? (coord=[0,-1]) : (coord=[0,1])
        elsif threat.x != king.x && threat.y == king.y 
            threat.x > king.x ? (coord=[-1,0]) : (coord=[1,0])
        elsif threat.x < king.x
            threat.y > king.y ? (coord=[1,-1]) : (coord=[1,1])
        elsif threat.x > king.x
            threat.y > king.y ? (coord=[-1,-1]) : (coord=[-1,1])
        end
        x_axis = threat.x 
        y_axis = threat.y 
        loop do
            threat.x += coord[0]
            threat.y += coord[1]
            break if [threat.x, threat.y] == [king.x, king.y]
            @all_tokens.each do |token|
                next if token.color != king.color
                token.destination = [threat.x, threat.y]
                if token.is_a?(Pawn)
                    @escape_check << [token, token.destination] if pawn_move_possible?(token)
                elsif token.is_a?(Rook)
                    @escape_check << [token, token.destination] if rook_move_possible?(token)
                elsif token.is_a?(Knight)
                    @escape_check << [token, token.destination] if knight_move_possible?(token)
                elsif token.is_a?(Bishop)
                    @escape_check << [token, token.destination] if bishop_move_possible?(token)
                elsif token.is_a?(Queen)
                    @escape_check << [token, token.destination] if queen_move_possible?(token)
                end
            end
        end
        threat.x = x_axis
        threat.y = y_axis
    end

    def game_over(token)
        puts "Checkmate! Team #{token.color} wins the game!"
        @game_over = true
    end

    def next_player(turn_count)
        turn_count % 2 == 0 ? (return @player_order[1]) : (return @player_order[0])
    end

    def validate_move(player, move=nil, token=nil, start_position = false, destination = false, possible = false)
        loop do
            puts("*** Double check your move!") unless move.nil?
            move = gets.chomp
            show_move_log if move == "log"
            next if !!move.match(/[\s]/) == false
            next if move.split(" ").length != 3
            next if !!move.match(/[^0-9a-z]/i) == false
            move = format_input(move)
            start_position = interpret_coordinate(move[1])
            destination = interpret_coordinate(move[2])
            if !!start_position && !!destination
                token = interpret_token(move[0], player, start_position, destination)
                if !!token
                    break if move_possible?(token)
                end
            end
        end
        return token
    end

    def show_move_log
        @move_log.each do |log|
            puts(log)
        end
    end

    def format_input(move)  
        #Returns formatted move or returns false if move is improper
        move = move.downcase.split
        return move
    end

    def interpret_coordinate(user_input)
        # Returns two-element array coordinate.
        coordinate = user_input.split("")
        unless coordinate.length == 2
            puts "*** Your coordinates needs to be one letter and one number!"
            return false
        end
        unless !!coordinate[0].match(/[a-h]/i)
            puts "*** The first part of a coordinate needs to be a letter!"
            return false 
        end
        unless !!coordinate[1].match(/[1-8]/i)
            puts "*** The second part of a coordinate needs to be a number!"
            return false 
        end
        letter_translator = {
            "a" => 1,
            "b" => 2,
            "c" => 3,
            "d" => 4,
            "e" => 5,
            "f" => 6,
            "g" => 7,
            "h" => 8
        }
        coordinate[0] = letter_translator[coordinate[0]]
        coordinate[1] = coordinate[1].to_i
        return coordinate
    end

    def interpret_token(user_input, player, start_position, destination, match=false)
        # Validates token by checking that a token exists, of the correct 
        # name, of the correct color, in the correct coordinate, belonging
        # to the correct player.
        ["pawn", "rook", "knight", "bishop", "queen", "king"].each do |name|
             match = true if user_input == name
        end
        unless match
            puts "*** Your token name doesn't match a chess piece!"
            puts "*** Please enter: KING  QUEEN  BISHOP  KNIGHT  ROOK  PAWN"
            return false 
        end
        @all_tokens.each do |token|
            next unless token.player == player
            next unless token.color == player.color
            next unless token.name == user_input
            next unless token.x == start_position[0]
            next unless token.y == start_position[1]
            token.destination = destination
            return token
        end
        puts "*** Something's wrong...it might be the wrong player's turn, or the"
        puts "*** token you're trying to access might be in a slightly different spot!"
        return false
    end

    def move_possible?(token)
        if @check
            return true if @escape_check.include?([token, token.destination])
            return false
        end
        if token.is_a?(Pawn)
            return pawn_move_possible?(token)
        elsif token.is_a?(Rook)
            return rook_move_possible?(token)
        elsif token.is_a?(Knight)
            return knight_move_possible?(token)
        elsif token.is_a?(Bishop)
            return bishop_move_possible?(token)
        elsif token.is_a?(Queen)
            return queen_move_possible?(token)
        elsif token.is_a?(King)
            return king_move_possible?(token)
        end
        return false
    end

    def pawn_move_possible?(token)
        if !@check
            unless king_safe?(token)
                puts "*** If you do that, your king will be in danger!"
                return false
            end
        end
        token.moveset = [ [1,-1], [-1,-1], [0,-1], [0,-2] ] if token.color == "black"
        other_token = token_on_coord?(token.destination)
        if [token.x + token.moveset[0][0], token.y + token.moveset[0][1]] == token.destination || 
        [token.x + token.moveset[1][0], token.y + token.moveset[1][1]] == token.destination
            if !!other_token
                if same_team?(token, other_token)
                    puts "*** A piece on your team occupies that space!"
                    return false 
                end
            else
                puts "*** Pawns can only move like that to capture!"
                return false
            end
        elsif [token.x + token.moveset[2][0], token.y + token.moveset[2][1]] == token.destination
            if !!other_token
                puts "*** Another piece occupies that space!"
                return false 
            end
        elsif [token.x + token.moveset[3][0], token.y + token.moveset[3][1]] == token.destination
            unless token.y == 2 || token.y == 7
                puts "*** You can only move like that if the pawn is in its starting position!"
                return false 
            end
            if !!other_token
                puts "*** Another piece occupies that spot!"
                return false 
            end
            beneath = [token.destination[0], token.destination[1] - token.moveset[0][1]]
            if !!token_on_coord?(beneath)
                puts "*** You can't jump over other pieces with a pawn!"
                return false 
            end
        else
            return false
        end
        token.moveset = [ [-1,1], [1,1], [0,1], [0,2] ] 
        return true
    end

    def rook_move_possible?(token)
        unless destination_possible?(token)
            puts "*** That move isn't possible for this piece!"
            return false 
        end
        if !@check
            unless king_safe?(token)
                puts "*** If you do that, your king will be in danger!"
                return false
            end
        end
        if token.x < token.destination[0]  # Right
            return test_horizantal_movement(token, x=1)
        elsif token.x > token.destination[0]  # Left
            return test_horizantal_movement(token, x=-1)
        elsif token.y < token.destination[1]  # Up
            return test_vertical_movement(token, y=1)
        elsif token.y > token.destination[1]  # Down
            return test_vertical_movement(token, y=-1)
        end
        return check
    end
    
    def knight_move_possible?(token)
        if !@check
            unless king_safe?(token)
                puts "*** If you do that, your king will be in danger!"
                return false
            end
        end
        unless destination_possible?(token)
            puts "*** That move isn't possible for this piece!"
            return false 
        end 
        return true
    end

    def bishop_move_possible?(token)
        if !@check
            unless king_safe?(token)
                puts "*** If you do that, your king will be in danger!"
                return false
            end
        end
        unless destination_possible?(token)
            puts "*** That move isn't possible for this piece!"
            return false 
        end
        if token.x < token.destination[0]  # Diagonal-right
            return test_diagonal_movement(token, x=1, y=1) if token.y < token.destination[1]
            return test_diagonal_movement(token, x=1, y=-1) if token.y > token.destination[1]
        else  # Diagonal-left
            return test_diagonal_movement(token, x=-1, y=1) if token.y < token.destination[1]
            return test_diagonal_movement(token, x=-1, y=-1) if token.y > token.destination[1]
        end
    end

    def queen_move_possible?(token)
        if !@check
            unless king_safe?(token)
                puts "*** If you do that, your king will be in danger!"
                return false
            end
        end
        unless destination_possible?(token)
            puts "*** That move isn't possible for this piece!"
            return false 
        end
        if token.x < token.destination[0] # Moving right, x+1
            if token.y == token.destination[1] # Stable y, horizantal movement
                return test_horizantal_movement(token, x=1)
            else # Diagonal-right movement
                return test_diagonal_movement(token, x=1, y=1) if token.y < token.destination[1]
                return test_diagonal_movement(token, x=1, y=-1) if token.y > token.destination[1]
            end
        elsif token.x > token.destination[0] # Moving left, x-1
            if token.y == token.destination[1] # Stable y, horizantal movement
                return test_horizantal_movement(token, x=-1)
            else # Diagonal-left movement
                return test_diagonal_movement(token, x=-1, y=1) if token.y < token.destination[1]
                return test_diagonal_movement(token, x=-1, y=-1) if token.y > token.destination[1]
            end
        else # Vertical movement only
            return test_vertical_movement(token, y=1) if token.y < token.destination[1]
            return test_vertical_movement(token, y=-1) if token.y > token.destination[1]
        end
        return false
    end

    def test_horizantal_movement(token, x, current=nil)
        current = [token.x + x, token.y]
        while current != token.destination
            x.abs() > 1 ? (return false if !!token_on_coord?(current)) : (x)
            current = [token.x + x, token.y]
            x > 0 ? (x += 1) : (x -= 1)
        end
        return true
    end

    def test_vertical_movement(token, y, current=nil)
        current = [token.x, token.y + y]
        while current != token.destination
            y.abs() > 1 ? (return false if !!token_on_coord?(current)) : (y)
            current = [token.x, token.y + y]
            y > 0 ? (y += 1) : (y -= 1)
        end
        return true
    end

    def test_diagonal_movement(token, x, y, current=nil)
        current = [token.x + x, token.y + y]
        while current != token.destination
            x.abs() > 1 ? (return false if !!token_on_coord?(current)) : (x)
            current = [token.x + x, token.y + y]
            x > 0 ? (x += 1) : (x -= 1)
            y > 0 ? (y += 1) : (y -= 1)
        end
        return true
    end

    def king_move_possible?(token)
        return false unless king_safe?(token)
        unless destination_possible?(token)
            puts "*** That move isn't possible for this piece!"
            return false 
        end
        return true
    end

    def king_safe?(token)
        if token.color == "white"
            return false if adjacent_threat?(@white_king, token)
            return false if knight_threat?(@white_king, token)
            return false if horz_vert_threat?(@white_king, token)
            return false if diagonal_threat?(@white_king, token)
        elsif token.color == "black"
            return false if adjacent_threat?(@black_king, token)
            return false if knight_threat?(@black_king, token)
            return false if horz_vert_threat?(@black_king, token)
            return false if diagonal_threat?(@black_king, token)
        end
        return true
    end

    def adjacent_threat?(king, token=nil)
        adjacent = [ [1,0], [1,1], [1,0], [1,-1], [0,-1], [-1,-1], [-1,0], [-1,1] ]
        adjacent.each do |move|
            if @board.chess[king.x + move[0]][king.y + move[1]].is_a?(King)
                return true
            elsif @board.chess[king.x + move[0]][king.y + move[1]].is_a?(Pawn)
                if king.color == "white"
                    if move == [1,1] || move == [-1,1]
                        return true if @board.chess[king.x + move[0]][king.y + move[1]].color == "black"
                    end
                else
                    if move == [1,-1] || move == [-1,-1]
                        return true if @board.chess[king.x + move[0]][king.y + move[1]].color == "white"
                    end
                end
            end
        end
        return false
    end

    def knight_threat?(king, token=nil)
        knight = [ [1,2], [2,1], [2, -1], [1, -2], [-2, 1], [-1, 2], [-1, -2], [-2, -1] ]
        knight.each do |move|
            if @board.chess[king.x + move[0]][king.y + move[1]].is_a?(Knight)
                return true if @board.chess[king.x + move[0]][king.y + move[1]].color != king.color
            end
        end
        return false
    end

    def horz_vert_threat?(king, token=nil)
        horz_vert_check = [[0,1], [1,0], [0,-1], [-1,0]]
        horz_vert_check.each do |direction|
            current_x = king.x
            current_y = king.y
            loop do
                current_x += direction[0]
                current_y += direction[1]
                break if current_x > 8 || current_x < 1
                break if current_y > 8 || current_y < 1
                if @board.chess[current_x][current_y] == token
                    token.color != king.color ? (token) : (next)
                end
                next if @board.chess[current_x][current_y].is_a?(Tile)
                break if @board.chess[current_x][current_y].is_a?(Pawn)
                break if @board.chess[current_x][current_y].is_a?(Knight)
                break if @board.chess[current_x][current_y].is_a?(Bishop)
                return true if @board.chess[current_x][current_y].color != king.color
                break
            end
        end
        return false
    end

    def diagonal_threat?(king, token=nil)
        diagonal_check = [[1,1], [1,-1], [-1,1], [-1,-1]]
        diagonal_check.each do |direction|
            current_x = king.x
            current_y = king.y
            loop do
                current_x += direction[0]
                current_y += direction[1]
                break if current_x > 8 || current_x < 1
                break if current_y > 8 || current_y < 1
                if @board.chess[current_x][current_y] == token
                    token.color != king.color ? (token) : (next)
                end
                next if @board.chess[current_x][current_y].is_a?(Tile)
                break if @board.chess[current_x][current_y].is_a?(Pawn)
                break if @board.chess[current_x][current_y].is_a?(Knight)
                break if @board.chess[current_x][current_y].is_a?(Rook)
                return true if @board.chess[current_x][current_y].color != king.color
                break
            end
        end
        return false
    end

    def token_on_coord?(coord)
        return @board.chess[coord[0]][coord[1]] if !(@board.chess[coord[0]][coord[1]].is_a?(Tile))
        return false
    end

    def same_team?(token, other_token)
        if token.color != other_token.color
            token.capturing = other_token
            return false
        end
        return true
    end

    def destination_possible?(token)
        token.moveset.each do |move|
            if [token.x + move[0], token.y + move[1]] == token.destination
                other_token = token_on_coord?(token.destination)
                if !!other_token
                    same_team?(token, other_token) ? (return false) : (return true)
                end
                return true
            end
        end
        return false
    end

    def add_to_log(token)
        @move_log << "#{token.player.name} moved a #{token.name} from (#{token.x}, #{token.y}) to (#{token.destination[0]}, #{token.destination[1]})."
    end

    def capture_enemy(token)
        return if token.capturing.nil?
        if token.capturing.color == "black"
            token.capturing.x = -1
            token.capturing.y = -1
            @captured_by_white << token.capturing
            @all_tokens.delete(token.capturing)
            puts "Team White has captured a #{token.capturing.name}!"
        elsif token.capturing.color = "white"
            token.capturing.x = -1
            token.capturing.y = -1
            @captured_by_black << token.capturing
            @all_tokens.delete(token.capturing)
            puts "Team Black has captured a #{token.capturing.name}!"
        end
        @move_log << "#{token.player.name} captured a #{token.capturing.name} with a #{token.name}."
        token.capturing = nil
    end

    def move_token(token)
        (token.x + token.y) % 2 == 0 ? (@board.chess[token.x][token.y] = Tile.new("\u25A1")) : (@board.chess[token.x][token.y] = Tile.new("\u25A0"))
        token.x = token.destination[0]
        token.y = token.destination[1]
        @board.chess[token.x][token.y] = token
        token = promote_pawn(token) if token.is_a?(Pawn)
        token.color == "white" ? (@check = true if check_enemy_king?(token, @black_king)) : (@check = true if check_enemy_king?(token, @white_king))
        token.destination = nil
    end

    def promote_pawn(old_token, new_token=nil)
        return old_token unless old_token.destination[1] == 1 || old_token.destination[1] == 8
        loop do
            puts("What do you want to promote your pawn to?")
            puts("Queen   Bishop   Knight   Rook")
            new_token = gets.chomp
            if new_token.downcase == "queen"
                new_token = Queen.new(old_token.player, old_token.color, old_token.x, old_token.y)
                break
            elsif new_token.downcase == "bishop"
                new_token = Bishop.new(old_token.player, old_token.color, old_token.x, old_token.y)
                break
            elsif new_token.downcase == "knight"
                new_token = Knight.new(old_token.player, old_token.color, old_token.x, old_token.y)
                break
            elsif new_token.downcase == "rook"
                new_token = Rook.new(old_token.player, old_token.color, old_token.x, old_token.y)
                break
            end
            puts("Hang on, something didn't work.")
        end
        @board.chess[old_token.x][old_token.y] = new_token
        old_token.color == "white" ? (@white_tokens << new_token) : (@black_tokens << new_token)
        @all_tokens << new_token
        @all_tokens.delete(old_token)
        return new_token
    end

    def check_enemy_king?(token, enemy_king)
        if token.is_a?(Pawn)
            return true if adjacent_threat?(enemy_king, token)
        elsif token.is_a?(Rook)
            return true if horz_vert_threat?(enemy_king, token)
        elsif token.is_a?(Knight)
            return true if knight_threat?(enemy_king, token)
        elsif token.is_a?(Bishop)
            return true if diagonal_threat?(enemy_king, token)
        elsif token.is_a?(Queen)
            return true if horz_vert_threat?(enemy_king, token)
            return true if diagonal_threat?(enemy_king, token)
        end
        return false
    end

    def show_captured_by_black
        puts ""
        print "     "
        @captured_by_black.each do |captured|
            print captured.uni + " "
        end
        puts ""
    end

    def show_captured_by_white
        print "     "
        @captured_by_white.each do |captured|
            print captured.uni + " "
        end
        puts ""
    end

    def wipe_all_tokens
        @all_tokens.each do |token|
            token.destination = nil
            token.capturing = nil
        end
    end

end

class Player
    attr_accessor :name, :wins, :color, :game
    @@player_array = Array.new
    def initialize(name, wins = 0)
        @name = name
        @color = nil
        @wins = wins
        @@game = nil
        @@player_array << self
    end

    def all_players  # Displays all players
        @@player_array.each do |player|
            puts "Username: #{player.name} | Wins: #{player.wins}"
        end
    end

    def play_chess
        player1, player2 = two_player_selection
        two_player_countdown(player1, player2)  # Does nothing at the moment
        @@game = ChessGameFlow.new(player1, player2)
    end

    def two_player_selection #guides the player through player selection for two-player games
        puts "Who's going to play?"
        all_players
        puts "Player 1 is...(please type out player name)"
        player1 = player_selector
        puts "Player 2 is...(please type out player name)"
        player2 = player_selector
        return player1, player2
    end

    def player_selector #takes user input, checks current player roster, asks for new name if invalid input
        answer = gets.chomp
        selected = nil
        @@player_array.each do |player|
            selected = player if player.name == answer
        end
        if selected == nil
            puts "Hang on, somethings not right. Enter another name."
            return player_selector
        else
            return selected
        end
    end

    def two_player_countdown(player1, player2) #declares match, triggers loading sequence
        puts "Great. It's a showdown between #{player1.name} and #{player2.name}."
        puts "And...here we go!"
        #loading
    end

    def loading #loading animation
        sleep 1
        print "L"
        sleep 1
        print "O"
        sleep 1
        print "A"
        sleep 1
        print "D"
        sleep 1
        print "I"
        sleep 1
        print "N"
        sleep 1
        print "G"
        sleep 1
        puts ""
    end

end

class Menu
    def initialize
        @player = nil
        self.menu  # Calls the menu function automatically
    end

    def menu
        puts "
    |||||||||||||||
    || Main Menu ||
    ||||||||||||||| 
             "
        puts "
    1. Create new player

    2. View player profiles

    3. Play chess

    4. Exit the application
             "
        puts "Please enter a number."
        answer = gets.chomp #...asks them for a menu item
        case answer #depending on what number they input, a different mechanic is triggered.
        when "1"  # Creates new player
            puts "
    ||||||||||||||||
    || New player ||
    ||||||||||||||||
                 "
            puts "Please input a name."
            name = gets.chomp
            @player = Player.new(name)
            puts "Creating player..."
            puts "New player created!"
            self.menu
        when "2"  # Displays player roster
            puts "
    |||||||||||||||||||
    || Player Roster ||
    |||||||||||||||||||
                 "
            @player.all_players
            puts "Press enter to return to the main menu."
            gets.chomp
            self.menu
        when "3"  # Initiates chess setup
            @player.play_chess
        when "4"  # Exits the program
            puts "Goodbye!"
        else
            puts "I don't understand that command."
            self.menu 
        end
    end
end

test = Menu.new