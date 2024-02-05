`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2023 16:32:04
// Design Name: 
// Module Name: Display
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


module Display(

    //input [2:0]metro_konumu,
    input clk_10Hz,
    
    output reg[4:0] ones,
    output reg[4:0] tens,
    output reg[4:0] hundreds,
    output reg[4:0] thousands
    
    
    
    
    
    
    );
    
    reg [3:0]counter;
    reg [4:0]currentHarf;
    reg yavas_clk;
    
    reg [2:0]metro_konumu;
    
    reg [31:0]sayac;
    
    
    
    initial begin
        
        counter=0;//give here a index of display screen to make it generic.
        sayac=0;
        metro_konumu=0;
        
    end
    
    
    
    always @ (posedge clk_10Hz)begin  // 1ns -> 1s ye yavasladi
    
        if(sayac==10/2)begin
            yavas_clk=~yavas_clk;        
            sayac=0;
        end
        sayac=sayac+1;
        
    end
    
    
    
    always @ (posedge yavas_clk) begin
        
        if(metro_konumu==0)begin
        
           case(counter)
           
                5'd0:thousands=0;
                5'd1:thousands=11;
                5'd2:thousands=0;
                
                5'd3:thousands=19;
                
                5'd4:thousands=1;
                5'd5:thousands=8;
                5'd6:thousands=11;
                5'd7:thousands=0;
                
                5'd8:thousands=20;
                
           endcase
           
           case(counter)
           
                //0
                5'd0:hundreds=11;
                5'd1:hundreds=0;
                5'd2:hundreds=19;
                
                5'd3:hundreds=1;
                
                5'd4:hundreds=8;
                5'd5:hundreds=11;
                5'd6:hundreds=0;
                5'd7:hundreds=20;
                
                5'd8:hundreds=0;
                
           endcase
           
           case(counter)
           
                5'd0:tens=0;
                5'd1:tens=19;
                5'd2:tens=1;
                
                5'd3:tens=8;
                
                5'd4:tens=11;
                5'd5:tens=0;
                5'd6:tens=20;
                5'd7:tens=0;
                
                5'd8:tens=11;
                
           endcase
           
           case(counter)
           
                5'd0:ones=19;
                5'd1:ones=1;
                5'd2:ones=8;
                
                5'd3:ones=11;
                
                5'd4:ones=0;
                5'd5:ones=20;
                5'd6:ones=0;
                5'd7:ones=11;
                
                5'd8:ones=0;
                
           endcase
           
           counter=counter+1;
           if(counter==9)
                counter=0;
        end
       
        if(metro_konumu==1)begin
        
            case(counter)
           
                5'd0:thousands=1;
                5'd1:thousands=0;
                5'd2:thousands=6;
                5'd3:thousands=2;
                5'd4:thousands=4;
                
            endcase
           
           case(counter)
           
                5'd0:hundreds=1;
                5'd1:hundreds=0;
                5'd2:hundreds=6;
                5'd3:hundreds=2;
                5'd4:hundreds=4;
                
            endcase
            
            case(counter)
           
                5'd0:tens=1;
                5'd1:tens=0;
                5'd2:tens=6;
                5'd3:tens=2;
                5'd4:tens=4;
                
            endcase
            
            case(counter)
           
                5'd0:ones=1;
                5'd1:ones=0;
                5'd2:ones=6;
                5'd3:ones=2;
                5'd4:ones=4;
                
            endcase
           
           
            counter=counter+1;
            if(counter==5)
                counter=0;
        end
        
        if(metro_konumu==2)begin
        
            case(counter)
           
                5'd0:thousands=15;
                5'd1:thousands=13;
                5'd2:thousands=12;
                5'd3:thousands=14;
                
                5'd4:thousands=19;
                
                5'd5:thousands=15;
                5'd6:thousands=0;
                5'd7:thousands=9;
                5'd8:thousands=12;
                5'd9:thousands=11;
                5'd10:thousands=17;
                
            endcase
           
            counter=counter+1;
            if(counter==11)
                counter=0;
        end
        
        if(metro_konumu==3)begin
        
            case(counter)
           
                5'd0:thousands=5;
                5'd1:thousands=0;
                5'd2:thousands=14;
                5'd3:thousands=0;
                5'd4:thousands=7;
                
            endcase
           
            counter=counter+1;
            if(counter==5)
                counter=0;
        end
        
        if(metro_konumu==4)begin
        
            case(counter)
           
                5'd0:thousands=18;
                5'd1:thousands=3;
                5'd2:thousands=1;
                
            endcase
            
            counter=counter+1;
        end
        
        if(metro_konumu==5)begin
        
            case(counter)
           
                5'd0:thousands=16;
                5'd1:thousands=10;
                
            endcase
            
            counter=counter+1;
            if(counter==2)
                counter=0;
            
        end
        
       
    
    
    
    
    end
    
endmodule

