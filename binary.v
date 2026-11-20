module binary (
    input        w,
    input        clk,
    input        rst,
    output       z,
    output [2:0] state_out
);
    wire [2:0] S;      // current state
    wire [2:0] N;      // next state

    dff ff0 (.Default(1'b0), .clk(clk), .reset(rst), .D(N[0]), .Q(S[0]));
    dff ff1 (.Default(1'b0), .clk(clk), .reset(rst), .D(N[1]), .Q(S[1]));
    dff ff2 (.Default(1'b0), .clk(clk), .reset(rst), .D(N[2]), .Q(S[2]));

    wire q2 = S[2];
    wire q1 = S[1];
    wire q0 = S[0];

    wire go_one = w & ~q2 & ~(q1 & q0);   

    assign N[2] = w & (q2 | (q1 & q0));
    assign N[1] = go_one | (~w &  (q1 ^ q0));
    assign N[0] = go_one | (~w & ~(q1 ^ q0));

    assign z = q2 | (q1 & ~q0);

    assign state_out = S;
endmodule