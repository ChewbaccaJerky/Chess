
class Piece

  def initialize
    @name = "Piece"
  end

  def to_s
    @name
  end

end

class NullPiece < Piece

  def initialize
    @name = "Null"
  end

  def to_s
    ' '
  end
end

# Single Step
class King < Piece
  def initialize
    @name = "King"
  end

  def to_s
    'K'
  end

end


class Knight < Piece
  def initialize
    @name = "Knight"
  end

  def to_s
    'k'
  end
end

# Slide
class Queen < Piece
  def initialize
    @name = "Queen"
  end

  def to_s
    'Q'
  end
end

# Rook
class Rook < Piece

  def initialize
    @name = 'Rook'
  end

  def to_s
    'R'
  end
end
# Bishop

class Bishop < Piece

  def initialize
    @name = 'Bishop'
  end

  def to_s
    'B'
  end
end

class Pawn < Piece

  def initialize
    @name = 'Pawn'
  end

  def to_s
    'P'
  end

end
