=begin
  堆栈
=end
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'LinkedList'

class Stack
  attr_accessor :header, :footer

  def initialize(val)
    @header = @footer = LinkedList.new(val)
  end

  # 入栈
  def push(val)
    @footer = @footer.add(val)
    self
  end

  # 出栈
  def pop
    return nil if @footer.nil?
    val = @footer.val
    @footer = @footer.pre
    @footer.next = nil
    val
  end

  # 遍历
  def each
    node = self.footer
    while node
      yield(node)
      node = node.pre
    end
  end

  # 是否为空
  def empty?
    return self.header == self.footer
  end
end
