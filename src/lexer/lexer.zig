const std = @import("std");
const token = @import("./token.zig");
const TokenType = token.TokenType;
const Token = token.Token;

const Lexer = struct { 
  input: token.String, 
  position: i32, 
  read_position: i32, 
  ch: token.Char,

  //Methods
  pub fn new(input: token.String) *Lexer{
    const newToken = token.Token{
      .literal = input,
    };
    return &newToken;
  }

  fn read_char(self: *Lexer) void {
    if (self.readPosition >= self.input.len) {
      self.ch = 0;
    }
    else{
      self.ch = self.input[self.readPosition];
    }
    self.position = self.read_position;
    self.read_position += 1;
  }
  
  fn next_token(l: *Lexer) Token {
    var tok: token.Token = switch (l.ch) {
      '=' => return token.new_token(TokenType.ASSIGN, l.ch),
      ';' => return token.new_token(TokenType.SEMICOLON, l.ch),
      '(' => return token.new_token(TokenType.LPAREN, l.ch),
      ')' => return token.new_token(TokenType.RPAREN, l.ch),
      ',' => return token.new_token(TokenType.COMMA, l.ch),
      '+' => return token.new_token(TokenType.PLUS, l.ch),
      '{' => return token.new_token(TokenType.LBRACE, l.ch),
      '}' => return token.new_token(TokenType.RBRACE, l.ch),
       0  => return token.new_token(TokenType.EOF, ""),
      else => {
        if(is_letter(l.ch)){
          var tok: Token = Token{
          };
          tok.literal = l.read_identifier();
          tok.type = token.identifier_type(tok.literal);
          return tok;
        }
        else{
          return token.new_token(TokenType.ILLEGAL, l.ch);
        }
      } 
    };
    l.read_char();
    return tok;
  }

  fn read_identifier(l: *Lexer) token.String {
    var position = l.position;
    while(is_letter(l.ch)){
      l.read_char();
    }
    return l.input[position..l.position];
  }
  
};

fn is_letter(ch: token.Char) bool {
  return 'a' <= ch and ch <= 'z' or 'A' <= ch and ch <= 'Z';
}