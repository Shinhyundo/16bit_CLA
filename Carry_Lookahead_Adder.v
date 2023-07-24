module Carry_Lookahead_Adder
(
    input   [3:0]   A   ,
    input   [3:0]   B   ,
    input           C0  ,

    output  [3:0]   S   ,
    output  [3:0]   C   ,
    output          P   ,
    output          G
);

    wire    [3:0]   P_w;
    wire    [3:0]   G_w;

    //Full Adder instantiation
    FA  FA0
    (
        //INPUT
        .A(A[0])            ,
        .B(B[0])            ,
        .Ci(C0)             ,

        //OUTPUT
        .S(S[0])            ,
        .P(P_w[0])          ,
        .G(G_w[0])
    );

    FA  FA1
    (   
        //INPUT
        .A(A[1])            ,
        .B(B[1])            ,
        .Ci(C[0])           ,

        //OUTPUT
        .S(S[1])            ,
        .P(P_w[1])          ,
        .G(G_w[1])
    );

    FA  FA2
    (   
        //INPUT
        .A(A[2])            ,
        .B(B[2])            ,
        .Ci(C[1])           ,

        //OUTPUT
        .S(S[2])            ,
        .P(P_w[2])          ,
        .G(G_w[2])
    );

    FA  FA3
    (
        //INPUT
        .A(A[3])            ,
        .B(B[3])            ,
        .Ci(C[2])           ,

        //OUTPUT
        .S(S[3])            ,
        .P(P_w[3])          ,
        .G(G_w[3])
    );
    
    //Carry_Lookahead_Circuit instantiation
    Carry_Lookahead_Circuit Carry_Lookahead_Circuit
    (
        //INPUT
        .P(P_w)     ,
        .G(G_w)     ,
        .C0(C0)     ,   

        //OUTPUT
        .C(C)       ,
        .P_o(P)     ,
        .G_o(G)
    );

endmodule