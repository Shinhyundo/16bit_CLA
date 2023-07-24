`timescale  1ns/100ps
module tb_Carry_Lookahead_Adder_16;

    localparam SIM_TIME = 80;

    //Parallel Adder input
    reg     [15:0]  A;
    reg     [15:0]  B;
    reg             C0;

    //Parallel Adder output
    wire    [15:0]  C;
    wire    [15:0]  S;
    wire            P;
    wire            G;

    //Parallel Adder instantiation
    Carry_Lookahead_Adder_16 Carry_Lookahead_Adder_16
    (   
        //INPUT
        .A(A)           ,
        .B(B)           ,
        .C0(C0)         ,

        //OUTPUT
        .C(C)           ,
        .S(S)           ,
        .P(P)           ,
        .G(G)
    );

    initial 
    begin
        A = 16'd0;
        B = 16'd0;
        C0 = 1'b0;
        #10

        A = 16'd8;
        B = 16'd4;
        C0 = 1'b0;

        #10
        A = 16'hffff;
        B = 16'hffff;
        C0 = 1'b0;

        #10
        $finish;

    end

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb_Carry_Lookahead_Adder_16);
    end

endmodule