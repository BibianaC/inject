class Array

  def my_inject(&block)
    copy = self.dup
    memo = self[0]
    copy.shift
    copy.each {|num| memo = block.call(memo, num)}
    memo
  end

end