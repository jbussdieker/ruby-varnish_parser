module VarnishParser
  class Handler
    attr_reader :stack

    def initialize
      @stack = [[:root]]
    end

    def start_object
      push [:hash]
    end

    def end_object
      @stack.pop
    end

    def scalar(s)
      @stack.last << [:scalar, s]
    end

    def result
      root = @stack.first.last
      process root.first, root.drop(1)
    end

private

    def process(type, rest)
      case type
#      when :array
#        rest.map { |x| process(x.first, x.drop(1)) }
      when :hash
        Hash[rest.map { |x|
          process(x.first, x.drop(1))
        }.each_slice(2).to_a]
      when :scalar
        rest.first
      end
    end

    def push(o)
      @stack.last << o
      @stack << o
    end
  end
end
