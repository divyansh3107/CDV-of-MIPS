// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:17:44 05/01/2018 
// Design Name: 
// Module Name:    exmemPipeline 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module exmemPipeline(EXaluOut,EXwritedata,EXwriteReg,EXregWrite,EXmemtoReg,EXmemWrite,
				  MEMaluOut,MEMwritedata,MEMwriteReg,MEMregWrite,MEMmemtoReg,MEMmemWrite,clk);
				  
input [31:0]EXaluOut,EXwritedata;
input [4:0]EXwriteReg;
input clk;
input EXregWrite,EXmemtoReg,EXmemWrite;

output reg[4:0]MEMwriteReg;
output reg[31:0]MEMaluOut,MEMwritedata;
output reg MEMregWrite,MEMmemtoReg,MEMmemWrite;

always @(posedge clk)
begin
MEMwriteReg=EXwriteReg;
MEMaluOut=EXaluOut;
MEMwritedata=EXwritedata;

MEMregWrite=EXregWrite;
MEMmemtoReg=EXmemtoReg;
MEMmemWrite=EXmemWrite;
end

endmodule