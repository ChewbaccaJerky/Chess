require 'byebug'
require_relative 'piece'

class Board

  public
  attr_reader :grid
  def initialize
    @grid = Array.new(8) { Array.new(8){NullPiece.new} }
    @grid = make_starting_grid
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    raise "There is no piece at #{start_pos}" if self[start_pos].nil?
    raise "Out of bounds" if end_pos.any? {|x| x > 7 || x < 0}
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = NullPiece.new
  end

  def in_bounds?(pos)
    pos.all? {|cor| cor >= 0 && cor <= 7}
  end

  protected

  def make_starting_grid
    color = :white

    @grid.each_with_index do |row, i|
      @grid.each_with_index do |col, j|
        color = :black if j > 1
        pos = [i,j]
        next if i > 1 && i < 6
        if i == 1 || i == 6
          self[pos] = Pawn.new
        elsif j == 0 || j == 7
          self[pos] = Rook.new # Rook
        elsif j == 1 || j == 6
          self[pos] = Knight.new # Knight
        elsif j == 2 || j == 5
          self[pos] = Bishop.new # Bishop
        elsif j == 3
          self[pos] = King.new # King
        elsif j == 4
          self[pos] = Queen.new # Queen
        else
          self[pos] = NullPiece.new    # Null Piece
        end
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
end
