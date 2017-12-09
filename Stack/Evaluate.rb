=begin
    算术表达式求值
    简介：该算法由Edsger W. Dijkstra提出，用2个堆栈实现，其中一个堆栈保存运算符，另一个堆栈保存运算数
    链接：https://www.wikiwand.com/en/Edsger_W._Dijkstra [Edsger W. Dijkstra-维基百科]
         https://algs4.cs.princeton.edu/13stacks/Evaluate.java.html [JAVA版实现]
=end
$LOAD_PATH.unshift( File.dirname(File.dirname(__FILE__)) )
require 'Stack'

class String
  def is_number?
    true if Float(self) rescue false
  end
end

class Evaluate
    attr_accessor :ops, :vals

    OPERATORS = [[:'*', :'/'], [:'+', :'-']]
    BRACKETS = [:'(', :')']

    def initialize(expression)
        @ops = Stack.new
        @vals = Stack.new
        self.parse(expression)

    end

    # 解析
    def parse(expression)
        operators = OPERATORS.flatten
        expression.each_char do |char|
            @ops.push(char.to_sym) if operators.include?(char.to_sym)
            @vals.push(char.to_i) if char =~ /\d/
            if char == ')'
                val_next = @vals.pop
                val_pre = @vals.pop
                operate = @ops.pop.to_sym
                val = val_pre.send(operate, val_next)
                @vals.push(val)
            end
        end
        p @vals.bottom
    end

    # 运算
    def calc
        val_next = @vals.pop
        val_pre = @vals.pop
        operate = @ops.pop.to_sym
        val = val_pre.send(operate, val_next)
        @vals.push(val)
    end
end

calc = Evaluate.new('(1+((2+3)*(4*5)))')