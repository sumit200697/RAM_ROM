`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.08.2023 22:18:25
// Design Name: 
// Module Name: vending_machine_tb
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


module vending_machine_tb;

//inputs
reg clk;
reg [1:0] in;
reg rst;
 
 //outputs
 vending_machine dut (.clk(clk),
                          .rst(rst),
                          .in(in),
                          .out(out),
                          .change(change)
 );
 
 initial begin
    //initialise inputs
    
$dumpfile("vending_machine_123.vcd");
    $dumpvars(0,vending_machine_tb);
    rst =1;
    clk =0;
    
    #6 rst = 0;
        in = 1;
    #11 in = 1;
    #16 in = 1;
    #25 $finish;
 end
 always #5 clk = ~clk;
endmodule
