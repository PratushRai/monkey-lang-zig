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
  Lapren,
  Rparen,
  Lbrace,
  Rbrace,
  Function,
  Let
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
    TokenType.Function => return "Function",
    TokenType.Let => return "Let"
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

