const std = @import("std");
const Io = std.Io;

const zcc = @import("zcc");

pub fn main(init: std.process.Init) !void {
    const allocator = init.gpa;

    var driver = zcc.Driver{ .allocator = allocator, .io = init.io };
    try driver.run("../return_2.c", "../return_2.i");
}
