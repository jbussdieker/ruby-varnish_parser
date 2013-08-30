module VarnishParser
  class Tokenizer
    def initialize(io)
      #@ss = StringScanner.new(io.read)
=begin
backend cl10pod51dir01_node {
        .host = "10.0.25.239";
        .port = "2112";
        .first_byte_timeout = 65s;
        .probe = {
                .url = "/moov_check";
                .interval = 5s;
                .timeout = 1s;
                .window = 5;
                .threshold = 3;
        }
}

backend cl10pod50dir01_node {
        .host = "10.0.0.133";
        .port = "2112";
        .first_byte_timeout = 65s;
        .probe = {
                .url = "/moov_check";
                .interval = 5s;
                .timeout = 1s;
                .window = 5;
                .threshold = 3;
        }
}

director application_director round-robin {

    { .backend = cl10pod51dir01_node; }

    { .backend = cl10pod50dir01_node; }

}
=end
      @tokens = [
        [:STRING, 'backend'],
        [:STRING, 'cl10pod51dir01_node'],
        ['{', '{'],
          [:STRING, 'host'],
          ['=', '='],
          [:STRING, "10.0.25.239"],
          [';', ';'],
          [:STRING, 'port'],
          ['=', '='],
          [:STRING, "2112"],
          [';', ';'],
          [:STRING, 'first_byte_timeout'],
          ['=', '='],
          [:STRING, "65s"],
          [';', ';'],
          [:STRING, 'probe'],
          ['=', '='],
          ['{', '{'],
            [:STRING, 'url'],
            ['=', '='],
            [:STRING, "/moov_check"],
            [';', ';'],
            [:STRING, 'interval'],
            ['=', '='],
            [:STRING, "5s"],
            [';', ';'],
          ['}', '}'],
        ['}', '}'],
        [:STRING, 'backend'],
        [:STRING, 'cl10pod50dir01_node'],
        ['{', '{'],
          [:STRING, 'host'],
          ['=', '='],
          [:STRING, "10.0.25.239"],
          [';', ';'],
          [:STRING, 'port'],
          ['=', '='],
          [:STRING, "80"],
          [';', ';'],
        ['}', '}'],

        [:STRING, 'director'],
        [:STRING, 'application_director'],
        [:STRING, 'round-robin'],
        ['{', '{'],
          ['{', '{'],
            [:STRING, 'backend'],
            ['=', '='],
            [:STRING, "cl10pod51dir01_node"],
            [';', ';'],
          ['}', '}'],
          ['{', '{'],
            [:STRING, 'backend'],
            ['=', '='],
            [:STRING, "cl10pod50dir01_node"],
            [';', ';'],
          ['}', '}'],
        ['}', '}'],
      ]

      @tokens.reverse!
    end

    def next_token
      token = @tokens.pop
      #puts "GIVING TOKEN #{token}"
      token
    end
  end
end
