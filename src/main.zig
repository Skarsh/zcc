const std = @import("std");
const Io = std.Io;

const zcc = @import("zcc");

pub fn main() !void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    std.debug.print("What is my string? {s}", .{zcc.myString()});
}
