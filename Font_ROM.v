module Font_ROM(
    input [6:0] char,
    input [2:0] row,
    output reg [4:0] pixels
);
    reg [4:0] font [0:127][0:6];

    initial begin
        // 'H'
        font[72][0] = 5'b10001; font[72][1] = 5'b10001; font[72][2] = 5'b10001;
        font[72][3] = 5'b11111; font[72][4] = 5'b10001; font[72][5] = 5'b10001; font[72][6] = 5'b10001;
        // 'E'
        font[69][0] = 5'b11111; font[69][1] = 5'b10000; font[69][2] = 5'b11110;
        font[69][3] = 5'b10000; font[69][4] = 5'b10000; font[69][5] = 5'b10000; font[69][6] = 5'b11111;
        // 'L'
        font[76][0] = 5'b10000; font[76][1] = 5'b10000; font[76][2] = 5'b10000;
        font[76][3] = 5'b10000; font[76][4] = 5'b10000; font[76][5] = 5'b10000; font[76][6] = 5'b11111;
        // 'O'
        font[79][0] = 5'b01110; font[79][1] = 5'b10001; font[79][2] = 5'b10001;
        font[79][3] = 5'b10001; font[79][4] = 5'b10001; font[79][5] = 5'b10001; font[79][6] = 5'b01110;
    end

    always @(*) begin
        pixels = font[char][row];
    end
endmodule
