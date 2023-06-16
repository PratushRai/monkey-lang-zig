const token = @import("lexer/token.zig");
const lexer = @import("lexer/lexer.zig");
const std = @import("std");
const helper = @import("helper/helper.zig");

pub fn main() !void {
  var l = lexer.new_lexer("\n==!=/*-<>");

  var i: i32 = 0;
  while(i < l.input.len){
    var tok = l.next_token();
    tok.print_token();
    print_n();
    i+=1;
  } 
  var value = helper.compare_string("hello", "hella");
  std.debug.print("{any}", .{value});
}

fn print_n() void{
  std.debug.print("\n", .{});
}
