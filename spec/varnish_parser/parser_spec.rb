require 'varnish_parser'
require 'yaml'

describe VarnishParser::Parser do
  before do
    input   = StringIO.new File.read("spec/varnish_parser/test.vcl")
    tok     = VarnishParser::Tokenizer.new(input)
    parser  = VarnishParser::Parser.new(tok)
    @result = parser.parse.result
    @should = YAML.load(File.read("spec/varnish_parser/test.yml"))
  end

  it { @result.should eql(@should) }
end
