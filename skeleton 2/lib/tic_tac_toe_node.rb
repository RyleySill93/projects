require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @prev_move_pos = prev_move_pos
    @next_mover_mark = next_mover_mark
  end

  def losing_node?(evaluator)

  end

  def winning_node?(evaluator)

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    arr = []
    @board.rows.each.with_index do |row, i|
      row.each.with_index do |col, j|
        pos = [row, col]
        arr << TicTacToeNode.new(@board.dup, (@next_mover_mark == :x ? :o : :x), [i,j]) if @board[pos].empty?
      end
    end
    arr
  end

  def get_last_move(pos)
    @prev_move_pos = pos
  end
end
