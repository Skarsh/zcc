const std = @import("std");
const Io = std.Io;

const zcc = @import("zcc");

pub fn main(init: std.process.Init) !void {
    const allocator = init.gpa;

    const compiler = zcc.Compiler.init(allocator, init.io);
    try compiler.run("../return_2.c", "../return_2.i");
}
