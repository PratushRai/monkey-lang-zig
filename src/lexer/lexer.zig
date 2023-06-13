const std = @import("std");
const token = @import("token.zig");

pub const Lexer = struct {
  const Self = @This();
  input: []const u8,
  cursor: usize = 0,
  read_cursor: usize = 0,
  ch: u8 = 0,

  pub fn print_lexer(l: *Self) void{
    std.debug.print("input: {s}, position: {}, read_position: {}, ch: {c}", 
    .{l.input, l.cursor, l.read_cursor, l.ch});
  }

   pub fn readChar(self: *Self) void {
        if (self.read_cursor >= self.input.len) {
            self.ch = 0;
        } else {
            self.ch = self.input[self.read_cursor];
        }
        self.cursor = self.read_cursor;
        self.read_cursor += 1;
    }

  pub fn next_token(l: *Self) token.Token {
    var tok = token.Token{
      .ttype = token.TokenType.Illegal,
      .literal = l.current_string()
    };
    switch (l.ch) {
      '=' => tok.ttype = token.TokenType.Assign,
      ';' => tok.ttype = token.TokenType.SemiColon,
      ',' => tok.ttype = token.TokenType.Comma,
      '(' => tok.ttype = token.TokenType.Lapren,
      ')' => tok.ttype = token.TokenType.Rparen,
      '{' => tok.ttype =  token.TokenType.Lbrace,
      '}' => tok.ttype =  token.TokenType.Rbrace,
      '+' => tok.ttype =  token.TokenType.Plus,
       0  => tok.ttype = token.TokenType.Eof,
       else => tok.ttype = token.TokenType.Illegal
    }
    l.readChar();
    return tok;
  }

  fn current_string(self: Self) []const u8 {
    if(self.cursor < self.input.len){
      return self.input[self.cursor..self.cursor+1];
    }
    else {
      return "0";
    }
  }
};

pub fn new_lexer(input: []const u8) Lexer {
  var nl = Lexer{
    .input = input
  };
  nl.readChar();
  return nl;
}