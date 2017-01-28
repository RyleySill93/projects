require_relative '00_tree_node.rb'
require 'byebug'
class KnightPathFinder

  POSSIBLE_MOVES =[
    [2, 1],
    [2, -1],
    [-2, 1],
    [-2, -1],
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2]
  ]

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_pos = [start_pos]
    @nodes = []
    #build_move_tree(start_pos)
    #find_path(start_pos, [7,7])
  end

  def moves(current_pos)
    end_states =[]

    POSSIBLE_MOVES.each do |move|
      pos = [move.first + current_pos.first, move.last + current_pos.last]
      end_states << pos if valid_move?(pos)
    end

    end_states
  end

  def valid_move?(pos)
    (0..7).include?(pos.first) && (0..7).include?(pos.last)
  end

  def next_possible_moves(current_pos)
    moves(current_pos).reject{ |move| @visited_pos.include?(move) }
  end
  #UPDATE visited_pos



  def build_move_tree(current_pos)
    first_node = PolyTreeNode.new(current_pos)
    queue = [first_node]
    @nodes << first_node
    until queue.empty?
      next_possible_moves(queue[0].value).each do |move|
        @visited_pos << move
        new_node = PolyTreeNode.new(move)
        new_node.parent = queue[0]
        queue << new_node
        @nodes << new_node
      end
      queue.shift
    end

  end

  def find_path(current_pos, target_pos)
    current_node = @nodes.select{|node| node.value == current_pos}[0]
    answer = current_node.bfs(target_pos)
    trace_end_state_node(answer)
  end

  def trace_end_state_node(answer)
    arr = []
    until answer.parent.nil?
      arr << answer.value
      answer = answer.parent
    end
    arr << answer.value
    puts "ANSWER: #{arr.reverse}"
    arr.reverse
  end


end

k = KnightPathFinder.new([0,0])
p  k
k.build_move_tree([0,0])
k.find_path([0,0],[7,6])
