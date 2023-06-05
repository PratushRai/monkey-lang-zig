const std = @import("std");

const Char = u8;
const String = []Char;

const TokenType = enum { ILLEGAL, 
  EOF, 
  IDENT, 
  INT, 
  ASSIGN, 
  PLUS, 
  COMMA, 
  SEMICOLON, 
  LPAREN, 
  RPAREN, 
  LBRACE, 
  RBRACE, 
  FUNCTION, 
  LET 
};



const Token = struct { 
 type: TokenType,
 literal: String
};

pub fn new_token(ttype: TokenType, literal: String) Token{
  return Token{
    .literal = literal,
    .type = ttype,
  };
}

const map = std.ComptimeStringMap(TokenType, .{
  .{"let", .LET},
  .{"fn", .FUNCTION}
});

pub fn identifier_type(ident: String) TokenType {
  var tok =  map.get(ident);
  switch (tok) {
    TokenType.FUNCTION => return tok,
    TokenType.LET => return tok,
    else => return TokenType.IDENT
  }
}