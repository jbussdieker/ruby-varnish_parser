module VarnishParser
  class Tokenizer
    def initialize(io)
      @ss = StringScanner.new(io.read)
    end

    def next_token
      @ss.skip(/[ \t\n]+/)

      return if @ss.eos?
      case
      when text = @ss.scan(/[a-zA-Z0-9_\.\/\-"]+/) then [:STRING, text]
      else
        x = @ss.getch
        [x, x]
      end
    end
  end
end
