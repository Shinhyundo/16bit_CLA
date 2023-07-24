module Carry_Lookahead_Circuit
(
    input   [3:0]   P   ,       //Full Adder Sum
    input   [3:0]   G   ,       //Full Adder Carry out
    input           C0  ,       //Carry in

    output  [3:0]   C   ,
    output          P_o ,
    output          G_o           
);

    assign C[0] = G[0] | (P[0] & C0);
    assign C[1] = G[1] | (P[1] & C[0]); 
    assign C[2] = G[2] | (P[2] & C[1]);
    assign C[3] = G[3] | (P[3] & C[2]);

    assign P_o = &P;
    assign G_o = G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]);

endmodule