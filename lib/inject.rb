class Array

  def my_inject(init_or_sym = nil, sym = nil, &block)
    if sym
      memo = init_or_sym
      block = Proc.new {|memo, num| memo.send(sym, num)}
    elsif init_or_sym
      if init_or_sym.class == Symbol
        sym = init_or_sym
        block = Proc.new {|memo, num| memo.send(sym, num)}
      else
        memo = init_or_sym
      end
    else
      raise "Symbol or block must be passed" unless block
    end

    copy = self.dup
    if memo.nil?
      memo = self[0]
      copy.shift
    end
    copy.each {|num| memo = block.call(memo, num)}
    memo
  end

end