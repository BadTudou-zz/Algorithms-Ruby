=begin
  队列
=end
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'LinkedList'

class Queue
  attr_accessor :header, :footer

  def initialize()
    @header = @footer = nil
  end

  # 入列
  def enqueue(val=nil)
    return self if val.nil?

    if @footer.nil?
      @header = @footer = LinkedList.new(val)
    else
      @footer = @footer.add(val)
    end

    self
  end

  # 出列
  def dequeue
    if @header.nil?
      val = nil
    elsif @header == @footer
      val = @header.val
      @header = @footer = nil
    else
      val = @header.val
      @header = @header.next
      @header.pre = nil
    end
    val
  end

  # 遍历
  def each
    node = self.header
    while node
      yield(node)
      node = node.next
    end
  end

  # 队首
  def top
    return self.empty? ? nil : @footer.val
  end

  # 队尾
  def bottom
    return self.empty? ? nil : @header.val
  end

  # 是否为空
  def empty?
    return self.header.nil?
  end
end
