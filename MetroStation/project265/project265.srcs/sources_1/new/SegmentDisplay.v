`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2023 11:15:48
// Design Name: 
// Module Name: SegmentDisplay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SegmentDisplay(

    
    input clk,
    input [4:0] ones,
    input [4:0] tens,
    input [4:0] hundreds,
    input [4:0] thousands,
    
    output reg [0:6] seg,
    output reg [3:0] an    

    );
    
    reg [1:0] digit_select;     // 2 bit counter for selecting each of 4 digits
    reg [16:0] digit_timer;     // counter for digit refresh
    
    // Logic for controlling digit select and digit timer
    always @(posedge clk ) begin
        
                                            // 1ms x 4 displays = 4ms refresh period
            if(digit_timer == 99_999) begin         // The period of 100MHz clock is 10ns (1/100,000,000 seconds)
                digit_timer <= 0;                   // 10ns x 100,000 = 1ms
                digit_select <=  digit_select + 1;
            end
            else
                digit_timer <=  digit_timer + 1;
    end
    
    
    always @(digit_select) begin
        case(digit_select) 
            2'b00 : an = 4'b1110;   // Turn on ones digit
            2'b01 : an = 4'b1101;   // Turn on tens digit
            2'b10 : an = 4'b1011;   // Turn on hundreds digit
            2'b11 : an = 4'b0111;   // Turn on thousands digit
        endcase
    end
    
    
    
        parameter A = 7'b0001000;//A
        parameter B  = 7'b1100000;//B
        parameter C = 7'b0110001;//C
        parameter D = 7'b1000010;//D
        parameter E = 7'b0110000;//E
                
        parameter G = 7'b0100001;//G
        parameter H = 7'b1001000;//H
        parameter J = 7'b1000011;//J
        parameter I = 7'b1111001;//I
        parameter L = 7'b1110001;//L
       
        parameter M = 7'b0101011;//M
        parameter N = 7'b1101010;//N
        parameter O = 7'b0000001;//O
        parameter P = 7'b0011000;//P
        parameter R = 7'b0011001;//R
       
        parameter S = 7'b0100100;//S
        parameter T = 7'b1110000;//T
        parameter U = 7'b1000001;//U
        parameter Y = 7'b1000100;//Y
        parameter SPACE = 7'b1111111;//Empty 'Bosluk'
        parameter PASS = 7'b1111110;//pass
    
    
    
    
    
    
    
    always @*
        case(digit_select)
            2'b00 : begin       // ONES DIGIT
                        case(ones)
                            5'd0 : seg = A;
                            5'd1 : seg = B;
                            5'd2 : seg = C;
                            5'd3 : seg = D;
                            5'd4 : seg = E;
                            5'd5 : seg = G;
                            5'd6 : seg = H;
                            5'd7 : seg = J;
                            5'd8 : seg = I;
                            5'd9 : seg = L;
                            
                            5'd10 : seg = M;
                            5'd11 : seg = N;
                            5'd12 : seg = O;
                            5'd13 : seg = P;
                            5'd14 : seg = R;
                            5'd15 : seg = S;
                            5'd16 : seg = T;
                            5'd17 : seg = U;
                            5'd18 : seg = Y;
                            5'd19 : seg = SPACE;
                            5'd20 : seg = PASS;
                        endcase
                    end
                    
            2'b01 : begin       // TENS DIGIT
                        case(tens)
                            5'd0 : seg = A;
                            5'd1 : seg = B;
                            5'd2 : seg = C;
                            5'd3 : seg = D;
                            5'd4 : seg = E;
                            5'd5 : seg = G;
                            5'd6 : seg = H;
                            5'd7 : seg = J;
                            5'd8 : seg = I;
                            5'd9 : seg = L;
                            
                            5'd10 : seg = M;
                            5'd11 : seg = N;
                            5'd12 : seg = O;
                            5'd13 : seg = P;
                            5'd14 : seg = R;
                            5'd15 : seg = S;
                            5'd16 : seg = T;
                            5'd17 : seg = U;
                            5'd18 : seg = Y;
                            5'd19 : seg = SPACE;
                            5'd20 : seg = PASS;
                        endcase
                    end
                    
            2'b10 : begin       // HUNDREDS DIGIT
                        case(hundreds)
                            5'd0 : seg = A;
                            5'd1 : seg = B;
                            5'd2 : seg = C;
                            5'd3 : seg = D;
                            5'd4 : seg = E;
                            5'd5 : seg = G;
                            5'd6 : seg = H;
                            5'd7 : seg = J;
                            5'd8 : seg = I;
                            5'd9 : seg = L;
                            
                            5'd10 : seg = M;
                            5'd11 : seg = N;
                            5'd12 : seg = O;
                            5'd13 : seg = P;
                            5'd14 : seg = R;
                            5'd15 : seg = S;
                            5'd16 : seg = T;
                            5'd17 : seg = U;
                            5'd18 : seg = Y;
                            5'd19 : seg = SPACE;
                            5'd20 : seg = PASS;
                        endcase
                    end
                    
            2'b11 : begin       // MINUTES ONES DIGIT
                        case(thousands)
                            5'd0 : seg = A;
                            5'd1 : seg = B;
                            5'd2 : seg = C;
                            5'd3 : seg = D;
                            5'd4 : seg = E;
                            5'd5 : seg = G;
                            5'd6 : seg = H;
                            5'd7 : seg = J;
                            5'd8 : seg = I;
                            5'd9 : seg = L;
                            
                            5'd10 : seg = M;
                            5'd11 : seg = N;
                            5'd12 : seg = O;
                            5'd13 : seg = P;
                            5'd14 : seg = R;
                            5'd15 : seg = S;
                            5'd16 : seg = T;
                            5'd17 : seg = U;
                            5'd18 : seg = Y;
                            5'd19 : seg = SPACE;
                            5'd20 : seg = PASS;
                        endcase
                    end
        endcase

    
    
        
    
    
endmodule

