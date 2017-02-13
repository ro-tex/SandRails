class Go
  @board
  @visited

  @@WHITE = 1
  @@BLACK = 2

  def initializer
    (1..19).each do |x|
      (1..19).each do |y|
        @board[x] ||= []
        @board[x][y] = 0
      end
    end
  end

  def is_taken(x, y)
    @visited ||= []
    enemy
    side
    if @board[x][y] == @WHITE
      side = @@WHITE
      enemy = @@BLACK
    else
      side = @@BLACK
      enemy = @@WHITE
    end

    @visited[x] ||= []
    @visited[x][y] = true

    if @board[x - 1][y] = side && !@visited[x - 1][y]
      return is_taken(x - 1, y)
    elsif @board[x - 1][y] == 0
      return false
    end

    true
  end
end
