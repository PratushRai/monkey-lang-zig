const token = @import("lexer/token.zig");
const lexer = @import("lexer/lexer.zig");
const std = @import("std");
const helper = @import("helper/helper.zig");

pub fn main() !void {

    var reader = std.io.getStdIn().reader();
    var writer = std.io.getStdOut().writer();
    try writer.print("Welcome to monkey lang repl.\n", .{});
    try writer.print(">>> ", .{});
    var buffer: [1024]u8 = undefined;
    while (try reader.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        var lex = lexer.init(line);
        while (lex.has_tokens()) {
            const tok = lex.next_token();
            tok.print_token();
        }
        try writer.print(">>> ", .{});
    }

  // var i: i32 = 0;
  // while(i < l.input.len){
  //   var tok = l.next_token();
  //   tok.print_token();
  //   print_n();
  //   i+=1;
  // } 
  
  // var value = helper.compare_string("hello", "hella");
  // std.debug.print("{any}", .{value});
}

fn print_n() void{
  std.debug.print("\n", .{});
}
