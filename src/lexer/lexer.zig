const std = @import("std");

pub fn sayHello() void {
    std.debug.print("Hello", .{});
}
