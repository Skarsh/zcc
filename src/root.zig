const std = @import("std");
const Io = std.Io;
const Dir = Io.Dir;

pub const Compiler = struct {
    allocator: std.mem.Allocator,
    io: Io,

    const Self = @This();

    pub fn init(allocator: std.mem.Allocator, io: Io) Self {
        return Self{
            .allocator = allocator,
            .io = io,
        };
    }

    pub fn run(self: Self, input_file: []const u8, output_file: []const u8) !void {
        try self.preprocess(input_file, output_file);
    }

    fn preprocess(self: Self, input_file: []const u8, output_file: []const u8) !void {
        const args = [_][]const u8{ "gcc", "-E", "-P", input_file, "-o", output_file };
        const result = try std.process.spawn(self.io, .{ .argv = &args });
        std.debug.print("pre-process result: {}\n", .{result});
    }

    fn compile() void {}

    fn assemble(self: Self, input_file: []const u8, output_file: []const u8) !void {
        const args = [_][]const u8{ "gcc", input_file, "-o", output_file };
        const result = try std.process.spawn(self.io, .{ .argv = &args });
        std.debug.print("assemble result: {}\n", .{result});

        const dir = Dir.cwd();
        try Dir.deleteFile(dir, self.io, input_file);
    }
};
