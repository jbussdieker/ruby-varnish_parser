require 'varnish_parser'
require 'yaml'

describe VarnishParser::Parser do
  before do
    @should = YAML.load(File.read("spec/varnish_parser/test.yml"))
  end

  def test_file(file)
    input   = StringIO.new File.read(File.join("spec/varnish_parser", file))
    tok     = VarnishParser::Tokenizer.new(input)
    parser  = VarnishParser::Parser.new(tok)
    @result = parser.parse.result
  end

  it { test_file("test.vcl").should eql(@should) }
  it { test_file("test2.vcl").should eql(@should) }
end
