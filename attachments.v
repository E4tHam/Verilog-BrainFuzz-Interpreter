// attachments.v

module ROM_chip (
    input  [3:0] address , // Address input
    output [7:0] data    , // Data output
    input CEb              // Active Low Chip Enable
);

    // 8 bit words at 16 addresses
    reg [7:0] mem [0:15] ;

    assign data = ( !CEb ) ? mem[address] : 8'b zzzz_zzzz ;

    initial begin
        $readmemb( "ROM.mem" , mem ); // ROM.mem is memory file
    end

endmodule


module RAM_chip (
    input [3:0] address  , // Address input
    output [7:0] data    , // Data I/O
    input CEb            , // Active Low Chip Enable
    input WEb            , // Active Low Write Enable
    input OEb              // Active Low Output Enable ( high -> I | low -> O )
);

    // 8 bit words at 16 addresses
    reg [7:0] mem [0:15] ;

    // if CE and OE, data = mem[address] ; else set it to zzzz_zzzz
    assign data = ( !CEb && WEb && !OEb ) ? mem[address] : 8'b zzzz_zzzz ;

    // if CE and WE, mem[address] = data
    always @ ( CEb or WEb )
        if ( !CEb && !WEb && OEb ) mem[address] = data;

    // if WE and OE, display "ERROR"
    always @ ( WEb or OEb )
        if ( !WEb && !OEb ) $display ( "RAM_chip ERROR: OE and WE both active" ) ;

    // data reset to all 1s
    integer i;
    initial
        for ( i = 0; i < 16; i = i+1 ) mem[i] <= 0 ;

endmodule
