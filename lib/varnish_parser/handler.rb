module VarnishParser
  class Handler
    attr_reader :stack

    def initialize
      @stack = [[:root]]
    end

    def start_object
      push [:hash]
    end

    def start_array
      push [:array]
    end

    def end_object
      @stack.pop
    end

    def end_array
      @stack.pop
    end

    def scalar(s)
      @stack.last << [:scalar, s]
    end

    def result
      items = @stack.first[1..-1]
      items.collect {|item| process(item.first, item.drop(1))}
    end

private

    def process(type, rest)
      case type
      when :array
        rest.map { |x| process(x.first, x.drop(1)) }
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
