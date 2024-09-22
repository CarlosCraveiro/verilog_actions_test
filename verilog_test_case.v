`include "BCDto7Segment.v"

module verilog_test_case;

    reg [3:0] bcd;          // BCD input
    wire [6:0] seg;         // 7-segment output

    // Instantiate the BCD to 7-segment module
    BCDto7Segment uut (
        .bcd(bcd),
        .seg(seg)
    );

    // Test all possible BCD inputs
    initial begin
        $display("Time\tBCD\t7-segment");
        $monitor("%0d\t%b\t%b", $time, bcd, seg);

        // Test for BCD 0 to 9
        bcd = 4'b0000; #10;
        bcd = 4'b0001; #10;
        bcd = 4'b0010; #10;
        bcd = 4'b0011; #10;
        bcd = 4'b0100; #10;
        bcd = 4'b0101; #10;
        bcd = 4'b0110; #10;
        bcd = 4'b0111; #10;
        bcd = 4'b1000; #10;
        bcd = 4'b1001; #10;

        // Test for non-BCD values (1010-1111)
        bcd = 4'b1010; #10;
        bcd = 4'b1011; #10;
        bcd = 4'b1100; #10;
        bcd = 4'b1101; #10;
        bcd = 4'b1110; #10;
        bcd = 4'b1111; #10;

        $finish;
    end

endmodule

