module top (
    input  [0:0] sw,      
    input        btnC,    // clock
    input        btnU,    // reset
    output [9:0] led
);
    wire w   = sw[0];
    wire clk = btnC;
    wire rst = btnU;

    wire       z_oh, z_bin;
    wire [4:0] s_oh;
    wire [2:0] s_bin;

    onehot u_oh  (.w(w), .clk(clk), .rst(rst), .z(z_oh),  .state_out(s_oh));
    binary  u_bin (.w(w), .clk(clk), .rst(rst), .z(z_bin), .state_out(s_bin));

    assign led[0]   = z_oh;     // one-hot z
    assign led[1]   = z_bin;    // binary z
    assign led[6:2] = s_oh;     // one-hot states A..E
    assign led[9:7] = s_bin;    // binary state
endmodule