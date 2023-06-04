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
