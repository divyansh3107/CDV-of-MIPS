// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:16:03 05/01/2018 
// Design Name: 
// Module Name:    registerFile 
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
module registerFile(WBregWrite,clk,idRs,idRt,idregA,idregB,WBwriteReg,WBresult);//reading in decoding stage and writing in WB

input WBregWrite,clk;
input [4:0]idRs,idRt,WBwriteReg;
input [31:0]WBresult;

output reg [31:0]idregA,idregB;

reg [31:0]registers[11:0]; //12 registers r0 to r11 with the data same as their index.Each of size 32bits.

always @(clk,WBresult,WBwriteReg,WBregWrite) //write back at +ve half of clk
begin
if(WBregWrite && clk)
registers[WBwriteReg]<=WBresult;
end

always @(clk,idRs,idRt,WBwriteReg) //read at -ve half 
begin
if(~clk)begin
idregA <=registers[idRs];
idregB <=registers[idRt];
end
end

always @(clk)begin
$display("regA=%d regB=%d",idRs,idRt);
end

endmodule
