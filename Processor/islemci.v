`timescale 1ns/1ps

`define BELLEK_ADRES    32'h8000_0000
`define VERI_BIT        32
`define ADRES_BIT       32
`define YAZMAC_SAYISI   32

module islemci (
    input                       clk,
    input                       rst,
    output reg  [`ADRES_BIT-1:0]    bellek_adres,
    input   [`VERI_BIT-1:0]     bellek_oku_veri,
    output reg [`VERI_BIT-1:0]     bellek_yaz_veri,
    output  reg                    bellek_yaz
);

localparam GETIR        = 2'd0;
localparam COZYAZMACOKU = 2'd1;
localparam YURUTGERIYAZ = 2'd2;

reg [1:0] simdiki_asama_r;
reg [`VERI_BIT-1:0] yazmac_obegi [0:`YAZMAC_SAYISI-1];
reg [`ADRES_BIT-1:0] ps_r;



reg [31:0]buyruk;

reg [4:0] rs2,rs1,rd;//Errorr!!! should be not signed

reg signed[31:0] data1,data2;
reg [31:0] data1U;

reg signed [19:0] anlik20;
reg signed [11:0] anlik12;

reg signed [31:0]anlik32;
reg [31:0]anlik32U;

initial begin

    yazmac_obegi[0]=0;
    bellek_adres = ps_r;
    bellek_yaz_veri = 32'hdead_beef;
    bellek_yaz = 1'b0;

end


always @(posedge clk) begin

    if (rst) begin
        ps_r <= `BELLEK_ADRES;
        simdiki_asama_r <= GETIR;
        bellek_adres<=`BELLEK_ADRES;
    end
    
    else begin
    
        //********************Step*******1*************************
        
        if(simdiki_asama_r==GETIR)begin
            
           //$display("PC:%d-------------Buyruk:%h", ps_r,buyruk);
            bellek_yaz = 1'b0;
            buyruk=bellek_oku_veri;
            
             
            
            ps_r=ps_r+4;   
            bellek_adres=ps_r; 
            
            
            //$display("*************");
            /*$display("yazmac_obegi[0]:%d",yazmac_obegi[0]);
            $display("yazmac_obegi[1]:%d",yazmac_obegi[1]);
            $display("yazmac_obegi[2]:%d",yazmac_obegi[2]);
            $display("yazmac_obegi[3]:%d",yazmac_obegi[3]);
            $display("yazmac_obegi[4]:%d",yazmac_obegi[4]);
            $display("yazmac_obegi[5]:%h",yazmac_obegi[5]);
            $display("yazmac_obegi[6]:%d",yazmac_obegi[6]);
            $display("yazmac_obegi[7]:%d",yazmac_obegi[7]);
            $display("yazmac_obegi[8]:%d",yazmac_obegi[8]);
            $display("yazmac_obegi[9]:%d",yazmac_obegi[9]);
            $display("yazmac_obegi[10]:%d",yazmac_obegi[10]);
            $display("yazmac_obegi[11]:%d",yazmac_obegi[11]);
            $display("yazmac_obegi[12]:%d",yazmac_obegi[12]);
            $display("yazmac_obegi[13]:%d",yazmac_obegi[13]);
            $display("yazmac_obegi[14]:%d",yazmac_obegi[14]);
            $display("yazmac_obegi[15]:%d",yazmac_obegi[15]);
            $display("yazmac_obegi[16]:%d",yazmac_obegi[16]);
            $display("yazmac_obegi[17]:%d",yazmac_obegi[17]);
            $display("yazmac_obegi[18]:%d",yazmac_obegi[18]);
            $display("yazmac_obegi[19]:%d",yazmac_obegi[19]);
            $display("yazmac_obegi[20]:%d",yazmac_obegi[20]);
            $display("yazmac_obegi[21]:%d",yazmac_obegi[21]);
            $display("yazmac_obegi[22]:%d",yazmac_obegi[22]);
            $display("yazmac_obegi[23]:%d",yazmac_obegi[23]);
            $display("yazmac_obegi[24]:%d",yazmac_obegi[24]);
            $display("yazmac_obegi[25]:%d",yazmac_obegi[25]);
            $display("yazmac_obegi[26]:%d",yazmac_obegi[26]);
            $display("yazmac_obegi[27]:%d",yazmac_obegi[27]);
            $display("yazmac_obegi[28]:%d",yazmac_obegi[28]);
            $display("yazmac_obegi[29]:%d",yazmac_obegi[29]);
            $display("yazmac_obegi[30]:%d",yazmac_obegi[30]);
            $display("yazmac_obegi[31]:%d",yazmac_obegi[31]);
                    
             //$display("yazmac_obegi:%d",yazmac_obegi[30]);
            
            //$display("Buyruk:%h",buyruk);
            
            $display("yazmac_obegi[0]:%d",yazmac_obegi[0]);
            $display("yazmac_obegi[1]:%d",yazmac_obegi[1]);
            $display("yazmac_obegi[2]:%d",yazmac_obegi[2]);
            $display("yazmac_obegi[3]:%d",yazmac_obegi[3]);
            $display("yazmac_obegi[4]:%d",yazmac_obegi[4]);    
            $display("yazmac_obegi[5]:%h",yazmac_obegi[5]);
            $display("***********************************");*/
           
        end
        
        //********************Step*******2*************************
        
        else if(simdiki_asama_r==COZYAZMACOKU)begin
        
            
            if(buyruk[6:0]==7'b0110011)begin //R type
            
            
                
            
                rs2=buyruk[24:20];
                rs1=buyruk[19:15];
                rd=buyruk[11:7];
                
                data2=yazmac_obegi[rs2];
                data1=yazmac_obegi[rs1];
                
                
                
        
            end
            
            if(buyruk[6:0]==7'b0010011 || buyruk[6:0]==7'b0000011 )begin //ADDI , LW
            
                      if(buyruk[14:12]==3'b010)begin//LW
            
                            anlik12=buyruk[31:20];
                            rs1=buyruk[19:15];
                            rd=buyruk[11:7];
                            data1=yazmac_obegi[rs1];
                            
                            bellek_adres=anlik12+data1;
                            
    
                      end
    
                      else if(buyruk[14:12]==3'b000)begin//ADDI
            
                            anlik12=buyruk[31:20];
                            rs1=buyruk[19:15];
                            rd=buyruk[11:7];
                        
                            
                            data1=yazmac_obegi[rs1];
    
                        end                
            end
            
            else if(buyruk[6:0]==7'b0100011 )begin //SW
            
                
            
                anlik12[11:5]=buyruk[31:25];
                anlik12[4:0]=buyruk[11:7];
                rs2=buyruk[24:20];
                rs1=buyruk[19:15];
                
                data2=yazmac_obegi[rs2];
                data1=yazmac_obegi[rs1];

                bellek_adres=data1+anlik12;
                bellek_yaz=1'b1;
                
                
                
            end
            
            else if(buyruk[6:0]==7'b1100011 )begin //BEQ , BNE, BLT
            
                //$display("Branch:%d",(ps_r-BELLEK_ADRES)/4);
                
                //$display("worked B");
            
                anlik12[12]=buyruk[31];
                anlik12[11]=buyruk[7];
                anlik12[10:5]=buyruk[30:25];
                anlik12[4:1]=buyruk[11:8];
                
                rs2=buyruk[24:20];
                rs1=buyruk[19:15];
                
                data2=yazmac_obegi[rs2];
                data1=yazmac_obegi[rs1];
                
            end
            
            else if(buyruk[6:0]==7'b1100111 )begin //JALR
            
                  /*if(buyruk[31]==1)
			          anlik32[31:12]=20'b11111_11111_11111_11111;
		           if(buyruk[31]==0)
			          anlik32[31:12]=20'b00000_00000_00000_00000;    */    
		
		              anlik12[11:0]=buyruk[31:20];
                      
                      //$display("Rd:%d",rd);
    
                      rs1=buyruk[19:15];
                      rd=buyruk[11:7];
                      
                      data1U=yazmac_obegi[rs1];
                    
            end
            
            else if(buyruk[6:0]==7'b1101111 )begin //JAL

                    anlik32=0;
                    
                    if(buyruk[31]==1)
                            anlik32[31:21]=11'b1111_1111_111;
                    if(buyruk[31]==0)
                            anlik32[31:21]=11'b0000_0000_000; 
            
                            //anlik32[0]=0;    
                            
                            anlik32[20]=buyruk[31];
                            anlik32[10:1]=buyruk[30:21];
                            anlik32[11]=buyruk[20];
                            anlik32[19:12]=buyruk[19:12];
                           
                            
                            rd=buyruk[11:7];
                            
                            

                
            end
            
            else if(buyruk[6:0]==7'b0110111)begin //LUI
            
                    anlik32U=0;
                    anlik32U[31:12]=buyruk[31:12];
                    
                    rd=buyruk[11:7];
                
            end
        
            else if(buyruk[6:0]==7'b0010111)begin //AUPIC
            
		        anlik32=0;
                anlik32[31:12]=buyruk[31:12];
                rd=buyruk[11:7];
                
            end
                    
        
        end
        
        
        //********************Step*******3*************************
        
        if(simdiki_asama_r==YURUTGERIYAZ)begin
        
        
                if(buyruk[6:0]==7'b0010011)begin//ADDI
                
                    yazmac_obegi[rd]=data1+anlik12;
                
                
                end
               
                
                
               
              
        
              if(buyruk[6:0]==7'b0110011)begin //R type
            
                      
                    
                    if(buyruk[31:25]==7'b0000000 && buyruk[14:12]==3'b000)begin//ADD
                    
                        yazmac_obegi[rd]=data1+data2;    
                        
                    end
                
                    else if(buyruk[31:25]==7'b0100000 && buyruk[14:12]==3'b000)begin//SUB
                    
                        yazmac_obegi[rd]=data1-data2;
                        
                    end
                
                    else if(buyruk[31:25]==7'b0000000 && buyruk[14:12]==3'b110)begin//OR
                    
                        yazmac_obegi[rd]= data1 | data2;    
                        
                    end
                
                    else if(buyruk[31:25]==7'b0000000 && buyruk[14:12]==3'b111)begin//AND
                    
                        yazmac_obegi[rd]= data1 & data2;    
                        
                    end
                
                    else if(buyruk[31:25]==7'b0000000 && buyruk[14:12]==3'b100)begin//XOR
                    
                        //$display("worked");
                        yazmac_obegi[rd]= data1 ^ data2;    
                        
                    end
                
                
                end
                
                
                //------------------------------------------
        
        
                if(buyruk[6:0]==7'b0100011 && buyruk[14:12]==3'b010)begin//SW
                    
                        
                        bellek_yaz_veri=data2;
                        bellek_adres=ps_r;
                        
                            
                end
        
                if(buyruk[6:0]==7'b0000011 && buyruk[14:12]==3'b010)begin//LW
                    
                        anlik32=bellek_oku_veri;
                        yazmac_obegi[rd]=anlik32;//May be error!!!
                        
                        bellek_adres=ps_r;
                            
                end
        
                if(buyruk[6:0]==7'b1100011 && buyruk[14:12]==3'b100)begin//BLT
                    
                    //$display("BLT");
                    
                        if(data2>data1)begin
                        
                            ps_r=ps_r+anlik12-4;
                            bellek_adres=ps_r;
                        end
                             
                end
        
                if(buyruk[6:0]==7'b1100011 && buyruk[14:12]==3'b001)begin//BNE
                    
                    //$display("BNE:%d",anlik12);
                        if(data2!=data1)begin
                        
                            ps_r=ps_r+anlik12-4;
                            bellek_adres=ps_r;
                        end
                             
                end
                
                if(buyruk[6:0]==7'b1100011 && buyruk[14:12]==3'b000)begin//BEQ
                    
                    //$display("BEQ");
                    
                        if(data2==data1)begin
                        
                            ps_r=ps_r+anlik12-4;
                            bellek_adres=ps_r;
                        end
                             
                end


		      if(buyruk[6:0]==7'b0110111)begin// LUI

                        
                        yazmac_obegi[rd]=anlik32U;    

		      end
		
        
            	if(buyruk[6:0]==7'b0010111)begin //AUPIC

                
                    //$display("Rd:%d",rd);
                    yazmac_obegi[rd]=ps_r+anlik32-4;			
        
        
                end
                
                if(buyruk[6:0]==7'b1101111 )begin //JAL	
        
                    //$display("worked");
                    yazmac_obegi[rd]=ps_r;
                    ps_r=ps_r+anlik32-4;        		
                    bellek_adres=ps_r;
                    
                  end

                if(buyruk[6:0]==7'b1100111 )begin //JALR
                    
                       yazmac_obegi[rd]=ps_r;
		          	   ps_r=data1U+anlik12-4;
                       bellek_adres=ps_r;
                       
		          end
        
        
            end
            
            //----------------------------------------
            
            
            simdiki_asama_r=simdiki_asama_r+1;
            if(simdiki_asama_r==3)
                simdiki_asama_r=0;
                
            
           //$display("bellek_adres:%h",bellek_adres);
            
            
            
        end
end


//assign bellek_adres = ps_r;
//assign bellek_yaz_veri = 32'hdead_beef;
//assign bellek_yaz = 1'b0;

endmodule