require_relative 'board'
require_relative 'cursor'
require 'colorize'
class Display
  attr_accessor :cursor_pos

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    print "-" * 25
    print "\n"
    print "   a  b  c  d  e  f  g  h\n"
    @board.grid.each_with_index do |row, i|
      print "#{i} "
      row.each_with_index do |piece, j|
        if @cursor_pos == [i, j]
          print "[#{piece}]".colorize(:color => :white, :background => :light_blue)
        else
          print "[#{piece}]"
        end
      end
      puts ""
    end
    print '-' * 25
    print "\n"
  end

end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  cursor = Cursor.new([7,0], board)
  display = Display.new(cursor.cursor_pos, board)
  display.render
  while true
    cursor.get_input
    display = Display.new(cursor.cursor_pos, board)
    system('clear')
    display.render
  end
end
