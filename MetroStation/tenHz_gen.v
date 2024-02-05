`timescale 1ns / 1ps

module tenHz_gen(
    input clk,
    output clk_10Hz
    );
    
    reg [22:0] ctr_reg = 0; // 23 bits to cover 5,000,000
    reg clk_out_reg = 0;
    
    always @(posedge clk)begin
        
        
            if(ctr_reg == 4_999_999) begin  // 100MHz / 10Hz / 2 = 5,000,000
                ctr_reg <= 0;
                clk_out_reg <= ~clk_out_reg;
            end
            else
                ctr_reg <= ctr_reg + 1;
    
    
    
    end

    assign clk_10Hz = clk_out_reg;

    
endmodule