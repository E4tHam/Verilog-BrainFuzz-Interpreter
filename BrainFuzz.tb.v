// BrainFuzz.tb.v

`include "attachments.v"


module brainfuzz_tb () ;

reg [3:0] address = 4'b0 ;
wire [7:0] data ;

reg ROM_CEb = 1'b1 ;

reg RAM_CEb = 1'b1 ;
reg RAM_WEb = 1'b1 ;
reg RAM_OEb = 1'b1 ;

// ROM_chip ROM (
//     .address ( address ) ,
//     .data ( data )       ,
//     .CEb ( ROM_CEb )
// );

RAM_chip RAM (
    .address ( address ) ,
    .data ( data )       ,
    .CEb ( RAM_CEb )     ,
    .WEb ( RAM_WEb )     ,
    .OEb ( RAM_OEb )
);

initial begin 
$dumpfile ( "dump.vcd" ) ;
$dumpvars ;
#10
//\\ =========================== \\//


$display ( data ) ;


//\\ =========================== \\//
$finish ;
end

endmodule
