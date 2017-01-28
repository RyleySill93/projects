require 'byebug'
class PolyTreeNode
  attr_reader :value, :children

  def initialize(value)
    @value = value
    @children = []
    @parent = nil
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    @parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'error' unless self.children.include?(child_node)
    child_node.parent = nil

  end

  def dfs(target_value)
    return self if self.value == target_value
    ans = nil
    self.children.each do |node|
      ans = node.dfs(target_value)
      break if ans
    end
    ans
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      return queue[0] if queue[0].value == target_value
      queue.shift.children.each do |child|
        queue << child
      end
    end
  end

end


# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")
#
# n3.parent = n1
#
# p n3
# p n1
