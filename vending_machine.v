`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2023 21:03:03
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(clk,rst,in,out,change);

input clk;
input rst;
input [1:0] in;  //01 = 5rs,  10 = 10 rs
output reg out;
output reg [1:0] change;

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;

reg [1:0] c_state, n_state;

always @(posedge clk) 
    begin
        if (rst==1)
            begin
            c_state=0;
            n_state=0;
            change= 2'b00;
            end
        else
        c_state=n_state;
        
        case(c_state)
          
            s0: //state 0 : 0rs
              if (in == 0)
                begin 
                    n_state=s0;
                    out = 0;
                    change = 2'b00;
                end      
              else if (in == 2'b01)  
                begin
                   n_state=s1;
                    out = 0;
                    change = 2'b00; 
                end
              else if (in == 2'b10)  
                begin
                   n_state=s2;
                    out = 0;
                    change = 2'b00; 
                end 
           
             s1:    //state 1 : 5rs
                 if (in == 0)  
                    begin
                       n_state=s0;
                        out = 0;
                        change = 2'b01;     //change returned 5rs
                    end  
                 else if (in == 2'b01)  
                    begin
                       n_state=s2;
                        out = 0;
                        change = 2'b00; 
                    end   
                 else if (in == 2'b10)  
                    begin
                       n_state=s0;
                        out = 1;
                        change = 2'b00; 
                    end 
              
              s2:    //state 2 : 10rs   
                if (in == 0)  
                    begin
                       n_state=s0;
                        out = 0;
                        change = 2'b10; 
                    end
                else if (in == 2'b01)  
                    begin
                       n_state=s0;
                        out = 1;
                        change = 2'b00; 
                    end 
                else if (in == 2'b10)  
                begin
                   n_state=s0;
                    out = 1;
                    change = 2'b01;     // change returned 5rs and 1 bottle
                end   
           endcase
                 
    end

endmodule
