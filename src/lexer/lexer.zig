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
  pub fn new(l: *Lexer, input: token.String) *Lexer{
    const newToken = token.Token{
      .literal = input,
    };
    l.read_char();
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
    l.skip_whitespace();
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
        else if(is_digit(l.ch)){
          var tok = Token{
            .type = TokenType.INT
          };
          tok.literal = l.read_number();
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
  
  fn read_number(l: *Lexer) token.String{
    var position = l.position;
    while (is_digit(l.ch)) {
      l.read_char();
    }
    return l.input[position..l.position];
  }
  
  fn skip_whitespace(l: *Lexer) void {
    while(l.ch == ' ' or l.ch == '\t' or l.ch == '\n' or l.ch == '\r'){
      l.read_char();
    }
  }
};

fn is_letter(ch: token.Char) bool {
  return 'a' <= ch and ch <= 'z' or 'A' <= ch and ch <= 'Z';
}

fn is_digit(ch: token.Char) bool {
  return '0' <= ch and ch <= '9';
}