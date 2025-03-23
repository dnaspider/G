const std = @import("std");
const windows = std.os.windows;
const kernel32 = windows.kernel32;

// Import the GetAsyncKeyState function from Windows API
// Use .C calling convention for x86_64 Windows (or omit callconv, as .C is the default)
extern "user32" fn GetAsyncKeyState(vKey: i32) callconv(.C) i32;

pub fn main() !void {
    // Infinite loop to continuously check for key presses
    while (true) {
        // Check if the 'X' key is pressed (VK code for 'X' is 0x58)
        // GetAsyncKeyState returns a value where the most significant bit (0x8000) indicates if the key is currently pressed
        if (GetAsyncKeyState(0x58) & 0x8000 != 0) {
            std.debug.print("Grok 3!\n", .{});
            // Small delay to prevent spamming the output (optional)
            std.time.sleep(100 * std.time.ns_per_ms); // 100ms delay
        }
    }
}
