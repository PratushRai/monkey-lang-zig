const std = @import("std");

pub const TokenType = enum{
  Illegal,
  Eof,
  Ident, 
  Int, 
  Assign,
  Plus,
  Comma,
  SemiColon,
  Gt,
  Lt,
  Minus,
  Slash,
  Star,
  Lapren,
  Rparen,
  Lbrace,
  Rbrace,
  Bang,
  Function,
  Let,
  False,
  True,
  Return,
  If,
  Else, 
  EqEq,
  BangEqual
};

pub fn ttype_to_string(ttype: TokenType) []const u8{
  var s = switch (ttype) {
    TokenType.Illegal => return "Illegal",
    TokenType.Eof => return "Eof",
    TokenType.Ident => return "Ident",
    TokenType.Int => return "Int",
    TokenType.Assign => return "Assign",
    TokenType.Plus => return "Plus",
    TokenType.Comma => return "Comma",
    TokenType.SemiColon => return "SemiColon",
    TokenType.Lapren => return "Lparen",
    TokenType.Rparen => return "Rparen",
    TokenType.Lbrace => return "Lbrace",
    TokenType.Rbrace => return "Rbrace",
    TokenType.Gt => return "Gt",
    TokenType.Lt => return "Lt",
    TokenType.Minus => return "Minus",
    TokenType.Slash => return "Slash",
    TokenType.Star => return "Star",
    TokenType.Function => return "Function",
    TokenType.Let => return "Let",
    TokenType.False => return "False",
    TokenType.True => return "True",
    TokenType.Return => return "Return",
    TokenType.If => return "If",
    TokenType.Else => return "Else",
    TokenType.EqEq => return "EqEq",
    TokenType.Bang => return "Bang",
    TokenType.BangEqual => return "BangEqual"
  };
  return s;
}

pub const Token = struct {
  ttype: TokenType,
  literal:  []const u8,
  
  pub fn print_token(t: Token) void {
    std.debug.print("[ ttype: {s}, literal: {s} ]", .{ttype_to_string(t.ttype), t.literal});
    std.debug.print("\n{s}", .{t.literal});
  }
};

