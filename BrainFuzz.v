// BrainFuzz.v

module EPROM (
    reg [2:0] ROM [0:15] ;
);
    
endmodule

module SRAM (
    reg [3:0] RAM [0:15] ;
);
    
endmodule

module fivebitadder (
    input [4:0] a ,
    input [4:0] b ,
    output reg [4:0] sum ,
    output reg cout
);
    always @ ( a or b )
    begin
        { cout, sum } = a + b;
    end
endmodule
