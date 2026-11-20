module onehot (
    input        w,
    input        clk,
    input        rst,
    output       z,
    output [4:0] state_out
);
    wire A, B, C, D, E;                 
    wire An, Bn, Cn, Dn, En;            

    dff ffA (.Default(1'b1), .clk(clk), .reset(rst), .D(An), .Q(A));
    dff ffB (.Default(1'b0), .clk(clk), .reset(rst), .D(Bn), .Q(B));
    dff ffC (.Default(1'b0), .clk(clk), .reset(rst), .D(Cn), .Q(C));
    dff ffD (.Default(1'b0), .clk(clk), .reset(rst), .D(Dn), .Q(D));
    dff ffE (.Default(1'b0), .clk(clk), .reset(rst), .D(En), .Q(E));

    assign An = 1'b0;                   
    assign Bn = ~w & (A | D | E);       
    assign Cn = ~w & (B | C);           
    assign Dn =  w & (A | B | C);       
    assign En =  w & (D | E);           

    assign z = C | E;                   // Moore output

    assign state_out = {E, D, C, B, A};
endmodule