const std = @import("std");

pub const Lexer = struct {
  input: []const u8,
  position: usize = 0,
  read_position: usize = 0,
  ch: u8 = 0,

  pub fn print(l: *Lexer) void{
    std.debug.print("input: {s}, position: {}, read_position: {}, ch: {}", 
    .{l.input, l.position, l.read_position, l.ch});
  }

  fn read_char(l: *Lexer) u8 {
    if(l.read_position >= l.input.len){
      l.ch = 0;
    }
    else{
      l.ch = l.input[l.read_position];
    }
    l.position = l.read_position;
    l.read_position += 1;
  }

};

pub fn new_lexer(input: []const u8) *Lexer {
  var nl = Lexer{
    .input = input
  };
  return &nl;
}