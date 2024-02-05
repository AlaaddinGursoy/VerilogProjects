`timescale 1ns / 1ps

module top(
    input clk,       // from Basys 3
    output [0:6] seg,       // 7 segment display segment pattern
    output [3:0] an      // 7 segment display anodes
    );
    
    // Internal wires for connecting inner modules
    wire w_10Hz;
    wire [4:0] w_1s, w_10s, w_100s, w_1000s;
    
    // Instantiate inner design modules
    tenHz_gen hz10(.clk(clk), .clk_10Hz(w_10Hz));
    
    Display disp(.clk_10Hz(w_10Hz),  .ones(w_1s),.tens(w_10s),
                 .hundreds(w_100s), .thousands(w_1000s));
    
    SegmentDisplay seg7(.clk(clk),  .ones(w_1s), .tens(w_10s),
                      .hundreds(w_100s), .thousands(w_1000s), .seg(seg), .an(an));
  
endmodule