module FA 
(   
    input   A       ,
    input   B       ,
    input   Ci      ,

    output  S       ,
    output  P       ,
    output  G      
);
    
    assign S = (A ^ B) ^ Ci;
    assign P = A | B;
    assign G = A & B;
    
endmodule