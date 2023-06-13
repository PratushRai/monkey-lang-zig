const token = @import("lexer/token.zig");
const lexer = @import("lexer/lexer.zig");
const std = @import("std");

pub fn main() !void {
  var l = lexer.new_lexer("=+(){},;");
  var i: i32 = 0;
  while(i < l.input.len){
    var tok = l.next_token();
    tok.print_token();
    print_n();
    i+=1;
  } 
}

fn print_n() void{
  std.debug.print("\n", .{});
}
