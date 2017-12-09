=begin
  双向链表
=end
class LinkedList
  attr_accessor :val, :next, :pre

  def initialize(val)
    @val = val
    @pre = nil
    @next = nil
  end

  # 添加结点
  def add(val)
    @next = LinkedList.new(val)
    @next.pre = self
    return @next
  end

  # 插入结点
  def insert(node, val)
    node_next = node.next
    node_new = LinkedList.new(val)
    node_new.pre = node
    node_new.next = node_next
    return node_new
  end

  # 删除结点
  def delete
    self.each do |node|
      node_pre = node.pre
      node_next = node.next
      if yield(node)
        if node_pre.nil? && node_next.nil?
          # 单结点
          @val = @pre = @next = nil
        elsif node_pre.nil?
          # 头结点
          @val = node_next.val
          @next = node_next.next
          node_next.next.pre = self
        elsif node_next.nil?
          # 尾结点
          node_pre.next = nil
        else
          # 普通结点
          node_next.pre = node_pre
          node_pre.next = node_next
        end
        return val
      end
    end
  end

  # 搜索
  def search
    self.each do |node|
      return node if yield(node)
    end
  end

  # 是否包含指定结点
  def include?(&block)
    raise ArgumentError.new('No block given') unless block_given?
    return self.search(&block) ? true : false
  end

  # 遍历
  def each
    node = self
    while node
      yield(node)
      node = node.next
    end
  end

end
