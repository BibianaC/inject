class Array

  def block_inject(&block)
    copy = self.dup
    memo = self[0]
    copy.shift
    copy.each {|num| memo = block.call(memo, num)}
    memo
  end

  def sym_inject(sym)
    (self).reduce(sym)
  end

  def init_inject(init)
    copy = self.dup
    memo = init
    copy.each {|num| memo = yield(memo, num)}
    memo
  end

  def init_sym_inject(init, sym)
    (self).reduce(init, sym)
  end

  def my_inject(*args, &block)
    if args.length == 0
      return block_inject(&block)
    end

    if args.length == 1 && args[0].class == Symbol
      return sym_inject(args[0])
    end

    if args.length == 1 && args[0].class == Fixnum
      return init_inject(args[0], &block)
    end

    if args.length == 2
      return init_sym_inject(args[0], args[1])
    end
    raise "invalid invocation"
  end

end