module Carry_Lookahead_Adder_16
(
    input   [15:0]  A   ,
    input   [15:0]  B   ,
    input           C0  ,

    output  [15:0]  S   ,
    output  [15:0]  C   ,
    output          P   ,
    output          G       
);
    //FA output wire
    wire    [15:0]  P_w;
    wire    [15:0]  G_w;
    
    //4bit CLA output wire
    wire    [3:0]   PP_w;
    wire    [3:0]   GG_w;

    //CLC output wire
    wire    [3:0]   C_w;

    //FA instantiations 
    FA U0(A[0], B[0], C0, S[0], P_w[0], G_w[0]);
    FA U1(A[1], B[1], C[1], S[1], P_w[1], G_w[1]);
    FA U2(A[2], B[2], C[2], S[2], P_w[2], G_w[2]);
    FA U3(A[3], B[3], C[3], S[3], P_w[3], G_w[3]);

    FA U4(A[4], B[4], C[4], S[4], P_w[4], G_w[4]);
    FA U5(A[5], B[5], C[5], S[5], P_w[5], G_w[5]);
    FA U6(A[6], B[6], C[6], S[6], P_w[6], G_w[6]);
    FA U7(A[7], B[7], C[7], S[7], P_w[7], G_w[7]);

    FA U8(A[8], B[8], C[8], S[8], P_w[8], G_w[8]);
    FA U9(A[9], B[9], C[9], S[9], P_w[9], G_w[9]);
    FA U10(A[10], B[10], C[10], S[10], P_w[10], G_w[10]);
    FA U11(A[11], B[11], C[11], S[11], P_w[11], G_w[11]);

    FA U12(A[12], B[12], C[12], S[12], P_w[12], G_w[12]);
    FA U13(A[13], B[13], C[13], S[13], P_w[13], G_w[13]);
    FA U14(A[14], B[14], C[14], S[14], P_w[14], G_w[14]);
    FA U15(A[15], B[15], C[15], S[15], P_w[15], G_w[15]);

    //CLA instantiations
    //CLA output port 7, but use only 6 port
    //C0, ,C[3:0]에서 , ,사이에 CLA의 출력 자리인데
    //16bit CLA 출력은 전부 FA에서 나오도록했어요
    //CLA랑 CRC는 Carry 계산용이라고 생각하시면 될 거 같아요
    Carry_Lookahead_Adder CLA0(G_w[3:0], P_w[3:0], C0, ,C[3:0], PP_w[0], GG_w[0]);
    Carry_Lookahead_Adder CLA1(G_w[7:4], P_w[7:4], C_w[0], ,C[7:4], PP_w[1], GG_w[1]);
    Carry_Lookahead_Adder CLA2(G_w[11:8], P_w[11:8], C_w[1], ,C[11:8], PP_w[2], GG_w[2]);
    Carry_Lookahead_Adder CLA3(G_w[15:12], P_w[15:12], C_w[2], ,C[15:12], PP_w[3], GG_w[3]);

    //CLC instantiation 
    Carry_Lookahead_Circuit CLC(PP_w, GG_w, C0, C_w, P, G);

endmodule