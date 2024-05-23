// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:19 04/19/2018 
// Design Name: 
// Module Name:    execute 
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
module execute(aluSrcA,aluSrcB,ctrl,EXaluOut,ALUzeroOp);
	 
input [31:0] aluSrcA,aluSrcB;
input [1:0]ctrl;
output reg [31:0] EXaluOut;
output reg ALUzeroOp;

always @(aluSrcA,aluSrcB,ctrl)
begin

case(ctrl)
2'b00:begin
EXaluOut = (aluSrcA + aluSrcB);
ALUzeroOp=1'b0;
end

2'b01:begin
EXaluOut = (aluSrcA - aluSrcB);
ALUzeroOp=1'b0;
end

//beq instruction
2'b10:begin
if(aluSrcA == aluSrcB)
ALUzeroOp=1;
else 
ALUzeroOp=0;
EXaluOut=32'b0;
end

//bne instruction
2'b11:begin
if(aluSrcA != aluSrcB)
ALUzeroOp=1;
else 
ALUzeroOp=0;
EXaluOut=32'b0;
end

endcase
end

endmodule