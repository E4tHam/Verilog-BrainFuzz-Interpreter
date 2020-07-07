// BrainFuzz.v

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
