=begin
  堆栈
=end
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'LinkedList'

class Stack
  attr_accessor :header, :footer

  def initialize()
    @header = @footer = nil
  end

  # 入栈
  def push(val=nil)
    return self if val.nil?

    if @footer.nil?
      @header = @footer = LinkedList.new(val)
    else
      @footer = @footer.add(val)
    end

    self
  end

  # 出栈
  def pop
    if @header.nil?
      val = nil
    elsif @header == @footer
      val = @header.val
      @header = @footer = nil
    else
      val = @footer.val
      @footer = @footer.pre
      @footer.next = nil
    end
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

  # 栈顶
  def top
    return self.empty? ? nil : @footer.val
  end

  # 栈底
  def bottom
    return self.empty? ? nil : @header.val
  end

  # 是否为空
  def empty?
    return self.header.nil?
  end
end