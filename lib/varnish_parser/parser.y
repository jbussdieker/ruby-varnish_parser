class VarnishParser::Parser

token STRING

rule
  directives
    : directives directive
    | directive
    ;
  directive
    : backend
    | director
    ;
  backend : string string object
  director : string string string start_array objects end_array
  objects
    : objects object
    | object
    ;
  object : start_object end_object
    | start_object pairs end_object
    ;
  pairs
    : pairs pair
    | pair
    ;
  start_object: '{' { @handler.start_object }
  end_object: '}' { @handler.end_object }
  start_array: '{' { @handler.start_array }
  end_array: '}' { @handler.end_array }
  pair: string '=' value
  value
    : string ';'
    | object
    ;
  string: STRING { @handler.scalar val[0].gsub(/^"|"$/, '') }
end

---- inner

  attr_reader :handler

  def initialize(tokenizer, handler = Handler.new)
    @tokenizer = tokenizer
    @handler   = handler
    super()
  end

  def parse
    do_parse
    handler
  end

  def next_token
    @tokenizer.next_token
  end
