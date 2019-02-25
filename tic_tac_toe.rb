class Board
  attr_accessor :arr
  def initialize
  @arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def to_s
    puts "---------"
    puts "||#{@arr[0].to_s}|#{@arr[1].to_s}|#{@arr[2].to_s}||"
    puts "---------"
    puts "||#{@arr[3].to_s}|#{@arr[4].to_s}|#{@arr[5].to_s}||"
    puts "---------"
    puts "||#{@arr[6].to_s}|#{@arr[7].to_s}|#{@arr[8].to_s}||"
    puts "---------"
  end

  def update_board(player, position)
    @arr[position.to_i - 1] = player.symbol
  end
end

class Player
  attr_accessor :name, :symbol
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

def start_game
  board = Board.new
  puts "First player, enter your name: "
  name = gets.chomp
  player1 = Player.new(name,"X")
  puts "Player 2, enter your name: "
  name = gets.chomp
  player2 = Player.new(name,"O")

  while !game_over?(board, player1, player2)
    take_turn(board, player1)
    if game_over?(board, player1, player2)
      break
    end
    take_turn(board, player2)
  end 
  puts game_over?(board, player1, player2)
end

def game_over?(board, player1, player2)
  game_over = false
  if check_for_win(board, player1, player2)
    game_over = check_for_win(board, player1, player2)
  elsif board.arr.none? {|e| e.is_a? Integer}
    game_over = "It's a draw! Nobody wins..."
  end
  game_over
end

def take_turn(board,player)
  board.to_s
    puts "#{player.name}: Choose a position!"
    position = gets.chomp
    if board.arr[position.to_i - 1] != position.to_i
      puts "That position is already chosen"
      take_turn(board, player)
    else
      board.arr[position.to_i - 1] = player.symbol
    end
end

def check_for_win(board, player1, player2)
  if board.arr[0] == board.arr[1] && board.arr[1] == board.arr[2] && board.arr[2] == player1.symbol
    return "#{player1.name} wins this round!"
  elsif board.arr[3] == board.arr[4] && board.arr[4] == board.arr[5] && board.arr[5] == player1.symbol
    return "#{player1.name} wins this round!"
  elsif board.arr[6] == board.arr[7] && board.arr[7] == board.arr[8] && board.arr[8] == player1.symbol
    return "#{player1.name} wins this round!"
  elsif board.arr[0] == board.arr[3] && board.arr[3] == board.arr[6] && board.arr[6] == player1.symbol
    return "#{player1.name} wins this round!"
  elsif board.arr[1] == board.arr[4] && board.arr[4] == board.arr[7] && board.arr[7] == player1.symbol
    return "#{player1.name} wins this round!"
  elsif board.arr[2] == board.arr[5] && board.arr[5] == board.arr[8] && board.arr[8] == player1.symbol
    return "#{player1.name} wins this round!"
  elsif board.arr[0] == board.arr[4] && board.arr[4] == board.arr[8] && board.arr[8] == player1.symbol
    return "#{player1.name} wins this round!"
  elsif board.arr[2] == board.arr[4] && board.arr[4] == board.arr[6] && board.arr[6] == player1.symbol
    return "#{player1.name} wins this round!"
  elsif board.arr[0] == board.arr[1] && board.arr[1] == board.arr[2] && board.arr[2] == player2.symbol
    return "#{player2.name} wins this round!"
  elsif board.arr[3] == board.arr[4] && board.arr[4] == board.arr[5] && board.arr[5] == player2.symbol
    return "#{player2.name} wins this round!"
  elsif board.arr[6] == board.arr[7] && board.arr[7] == board.arr[8] && board.arr[8] == player2.symbol
    return "#{player2.name} wins this round!"
  elsif board.arr[0] == board.arr[3] && board.arr[3] == board.arr[6] && board.arr[6] == player2.symbol
    return "#{player2.name} wins this round!"
  elsif board.arr[1] == board.arr[4] && board.arr[4] == board.arr[7] && board.arr[7] == player2.symbol
    return "#{player2.name} wins this round!"
  elsif board.arr[2] == board.arr[5] && board.arr[5] == board.arr[8] && board.arr[8] == player2.symbol
    return "#{player2.name} wins this round!"
  elsif board.arr[0] == board.arr[4] && board.arr[4] == board.arr[8] && board.arr[8] == player2.symbol
    return "#{player2.name} wins this round!"
  elsif board.arr[2] == board.arr[4] && board.arr[4] == board.arr[6] && board.arr[6] == player2.symbol
    return "#{player2.name} wins this round!"
  else
    return false
  end
end

start_game