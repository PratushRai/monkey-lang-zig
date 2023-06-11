const token = @import("lexer/token.zig");
const lexer = @import("lexer/lexer.zig");
const std = @import("std");

pub fn main() !void {
  const l = lexer.new_lexer("hello");
  l.print();
  std.debug.print("\n", .{});
  var t = token.Token{
    .ttype = token.TokenType.Assign,
    .literal = "="
  };
  t.print_token();
}

