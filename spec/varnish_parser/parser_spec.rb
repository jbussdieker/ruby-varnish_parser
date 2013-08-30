require 'varnish_parser'

describe VarnishParser::Parser do
  it "should work" do
    input   = StringIO.new "backend cl10pod51dir01_node {
        .host = \"10.0.25.239\";
        .port = \"2112\";
        .first_byte_timeout = 65s;
        .probe = {
                .url = \"/moov_check\";
                .interval = 5s;
                .timeout = 1s;
                .window = 5;
                .threshold = 3;
        }
}

backend cl10pod50dir01_node {
        .host = \"10.0.0.133\";
        .port = \"2112\";
        .first_byte_timeout = 65s;
        .probe = {
                .url = \"/moov_check\";
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
"
    tok     = VarnishParser::Tokenizer.new(input)
    parser  = VarnishParser::Parser.new(tok)
    handler = parser.parse
    handler.should eql(:done)
    #handler.result.should eql({})
  end
end
