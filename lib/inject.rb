class Array

  def my_inject(&block)
    copy = self.dup
    memo = self[0]
    copy.shift
    copy.each {|num| memo = block.call(memo, num)}
    memo
  end

  def sym_inject(sym)
    (1..4).reduce(sym)
  end

end