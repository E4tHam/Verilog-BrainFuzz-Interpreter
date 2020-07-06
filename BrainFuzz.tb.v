// BrainFuzz.tb.v

// `include "BrainFuzz.v"

module memory () ;

endmodule

module brainfuzz_tb () ;


integer i ;

reg [2:0] ROM [0:15] ;
reg [3:0] RAM [0:15] ;


initial begin 
//\\ =========================== \\//


$dumpfile ( "dump.vcd" ) ;
$dumpvars ;

$display( "Loading rom..." );
$readmemb( "ROM.mem" , ROM );
$display( "done!" );

for (i = 0; i < 16; i = i + 1) begin
    RAM[i] = 0;
end

for (i = 0; i < 16; i = i + 1) begin
    $display( RAM[i] ) ;
end

#1

$finish ;

//\\ =========================== \\//
end

endmodule
