#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.9
# from Racc grammer file "".
#

require 'racc/parser.rb'
module VarnishParser
  class Parser < Racc::Parser


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
##### State transition tables begin ###

racc_action_table = [
     6,     7,    20,     6,     6,     6,    20,     6,    14,     6,
    14,    14,    29,    14,    16,    26,    10,     6,    33 ]

racc_action_check = [
    13,     1,    13,     1,    18,     0,    18,    26,    26,     9,
     9,    22,    22,    15,    12,    21,     7,     5,    31 ]

racc_action_pointer = [
     3,     1,   nil,   nil,   nil,    15,   nil,    16,   nil,     7,
   nil,   nil,    11,    -2,   nil,    10,   nil,   nil,     2,   nil,
   nil,    10,     8,   nil,   nil,   nil,     5,   nil,   nil,   nil,
   nil,    12,   nil,   nil ]

racc_action_default = [
   -21,   -21,    -2,    -3,    -4,   -21,   -20,   -21,    -1,   -21,
    34,    -5,   -21,   -21,   -13,   -21,   -15,    -9,   -21,   -12,
   -14,   -21,   -21,    -8,   -10,   -11,   -21,    -6,    -7,   -16,
   -17,   -21,   -19,   -18 ]

racc_goto_table = [
     9,    11,     2,     8,    12,    19,    17,    23,    21,    22,
    25,    24,    27,    21,    28,    15,    18,     1,    32,    30,
   nil,    31 ]

racc_goto_check = [
     5,     6,     2,     2,     5,    13,    11,     6,     5,     8,
    13,    11,     9,     5,     6,     7,    12,     1,     6,    14,
   nil,     5 ]

racc_goto_pointer = [
   nil,    17,     2,   nil,   nil,    -5,    -8,     3,    -6,   -10,
   nil,    -7,     3,    -8,    -7 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,   nil,   nil,   nil,   nil,
    13,   nil,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  2, 8, :_reduce_none,
  1, 8, :_reduce_none,
  1, 9, :_reduce_none,
  1, 9, :_reduce_none,
  3, 10, :_reduce_none,
  6, 11, :_reduce_none,
  2, 15, :_reduce_none,
  1, 15, :_reduce_none,
  2, 13, :_reduce_none,
  3, 13, :_reduce_none,
  2, 19, :_reduce_none,
  1, 19, :_reduce_none,
  1, 17, :_reduce_13,
  1, 18, :_reduce_14,
  1, 14, :_reduce_15,
  1, 16, :_reduce_16,
  3, 20, :_reduce_none,
  2, 21, :_reduce_none,
  1, 21, :_reduce_none,
  1, 12, :_reduce_20 ]

racc_reduce_n = 21

racc_shift_n = 34

racc_token_table = {
  false => 0,
  :error => 1,
  :STRING => 2,
  "{" => 3,
  "}" => 4,
  "=" => 5,
  ";" => 6 }

racc_nt_base = 7

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "STRING",
  "\"{\"",
  "\"}\"",
  "\"=\"",
  "\";\"",
  "$start",
  "directives",
  "directive",
  "backend",
  "director",
  "string",
  "object",
  "start_array",
  "objects",
  "end_array",
  "start_object",
  "end_object",
  "pairs",
  "pair",
  "value" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

# reduce 3 omitted

# reduce 4 omitted

# reduce 5 omitted

# reduce 6 omitted

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

def _reduce_13(val, _values, result)
 @handler.start_object 
    result
end

def _reduce_14(val, _values, result)
 @handler.end_object 
    result
end

def _reduce_15(val, _values, result)
 @handler.start_array 
    result
end

def _reduce_16(val, _values, result)
 @handler.end_array 
    result
end

# reduce 17 omitted

# reduce 18 omitted

# reduce 19 omitted

def _reduce_20(val, _values, result)
 @handler.scalar val[0].gsub(/^"|"$/, '') 
    result
end

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module VarnishParser
