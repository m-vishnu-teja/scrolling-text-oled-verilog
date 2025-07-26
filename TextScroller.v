module TextScroller_Hello_Orange_Scaled_Centered #(
    parameter WIDTH = 96,
    parameter HEIGHT = 64,
    parameter SCALE = 2 // Set to 2 or 3 for larger text
)(
    input clk,
    input reset,
    input [12:0] pixel_index,
    output reg [15:0] pixel_data
);
    // Message: " HELLO "
    localparam MSG_LEN = 7;
    reg [6:0] message [0:MSG_LEN-1];
    initial begin
        message[0] = 7'd32; // ' '
        message[1] = 7'd72; // 'H'
        message[2] = 7'd69; // 'E'
        message[3] = 7'd76; // 'L'
        message[4] = 7'd76; // 'L'
        message[5] = 7'd79; // 'O'
        message[6] = 7'd32; // ' '
    end

    // Font parameters
    localparam FONT_W = 6; // 5 pixels + 1 space
    localparam FONT_H = 7;
    localparam SCALED_FONT_W = FONT_W * SCALE;
    localparam SCALED_FONT_H = FONT_H * SCALE;
    localparam MSG_PIXELS = MSG_LEN * SCALED_FONT_W;

    // Center vertically
    localparam V_OFFSET = (HEIGHT - SCALED_FONT_H) / 2;

    // Scrolling
    reg [9:0] scroll_x = 0;
    reg [23:0] frame_count = 0;
    always @(posedge clk) begin
        if (reset) begin
            scroll_x <= 0;
            frame_count <= 0;
        end else begin
            frame_count <= frame_count + 1;
            if (frame_count == 50000) begin // Adjust for scroll speed
                frame_count <= 0;
                if (scroll_x == MSG_LEN * SCALED_FONT_W - 1)
                    scroll_x <= 0;
                else
                    scroll_x <= scroll_x + 1;
            end
        end
    end

    // Pixel mapping
    wire [6:0] x = pixel_index % WIDTH;
    wire [6:0] y = pixel_index / WIDTH;

    // Only draw text in the vertically centered area
    wire [6:0] y_text = y - V_OFFSET;

    // Scrolled horizontal position
    wire [10:0] msg_x = (x + scroll_x) % (MSG_LEN * SCALED_FONT_W);

    // Which character and which column in character?
    wire [2:0] char_idx = msg_x / SCALED_FONT_W;
    wire [5:0] char_col_scaled = msg_x % SCALED_FONT_W;
    wire [2:0] char_col = char_col_scaled / SCALE;
    wire [2:0] char_row = y_text / SCALE;

    wire [6:0] char = message[char_idx];

    wire [4:0] font_pixels;
    Font_ROM font_rom(
        .char(char),
        .row(char_row),
        .pixels(font_pixels)
    );

    always @(*) begin
        if (y >= V_OFFSET && y < (V_OFFSET + SCALED_FONT_H) && char_col < 5 && char_row < FONT_H && font_pixels[4-char_col])
            pixel_data = 16'hFDA0; // Orange
        else
            pixel_data = 16'h0000; // Black
    end
endmodule
