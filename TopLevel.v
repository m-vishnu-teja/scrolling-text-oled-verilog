module TopLevel(
    input clk,        // Board clock (e.g., 100 MHz)
    input reset,
    output cs, sdin, sclk, d_cn, resn, vccen, pmoden
);
    wire oled_clk;
    wire [12:0] pixel_index;
    wire [15:0] pixel_data;
    wire frame_begin, sending_pixels, sample_pixel;
    wire [4:0] teststate;

    // Clock divider for 6.25 MHz
    clock_divider #(.DIVISOR(8)) clkdiv(
        .clk_in(clk),
        .rst(reset),
        .clk_out(oled_clk)
    );

    TextScroller_Hello_Orange_Scaled_Centered scroller(
        .clk(oled_clk),
        .reset(reset),
        .pixel_index(pixel_index),
        .pixel_data(pixel_data)
    );

    Oled_Display oled(
        .oled_clk(oled_clk),
        .reset(reset),
        .frame_begin(frame_begin),
        .sending_pixels(sending_pixels),
        .sample_pixel(sample_pixel),
        .pixel_index(pixel_index),
        .pixel_data(pixel_data),
        .cs(cs),
        .sdin(sdin),
        .sclk(sclk),
        .d_cn(d_cn),
        .resn(resn),
        .vccen(vccen),
        .pmoden(pmoden),
        .teststate(teststate)
    );
endmodule

// Parameterizable clock divider
module clock_divider #(parameter DIVISOR = 8)(
    input clk_in,
    input rst,
    output reg clk_out
);
    reg [$clog2(DIVISOR)-1:0] counter = 0;
    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            counter <= 0;
            clk_out <= 0;
        end else if (counter == DIVISOR-1) begin
            counter <= 0;
            clk_out <= ~clk_out;
        end else begin
            counter <= counter + 1;
        end
    end
endmodule


