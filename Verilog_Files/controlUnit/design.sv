// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:41:34 05/01/2018 
// Design Name: 
// Module Name:    controlUnit 
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
module controlUnit(instcode,PCSelectD,PCSelectE,regWrite,regDst,memWrite,aluSrc,memtoReg,branchD,ALUcontrolD);
input  [31:0]instcode;
input PCSelectD,PCSelectE;
output reg regWrite,regDst,memWrite,aluSrc,memtoReg,branchD;
output reg [1:0]ALUcontrolD;

always @(instcode)
begin

  if( (PCSelectD == 1'b1) || (PCSelectE == 1'b1) )begin
$display($time," Entered dont care control unit");
regWrite=1'bx;
regDst=1'bx;
memWrite=1'bx;
aluSrc=1'bx;
memtoReg=1'bx;
ALUcontrolD=2'bxx;
branchD=1'bx;
end

else begin

case (instcode[31:26])
6'b100011://load 35
begin
regWrite=1;
regDst=0;
memWrite=0;
aluSrc=1;
memtoReg=1;
ALUcontrolD=2'b00;
branchD=0;
end

6'b000000://R format instruction
begin
regWrite=1;
regDst=1;
memWrite=1'bx;//dont care
aluSrc=0;
memtoReg=0;
branchD=0;

case(instcode[5:0])
6'b100000:
ALUcontrolD=2'b00;//add
6'b100010:
ALUcontrolD=2'b01;//subtract
endcase
end

6'b001000://addi
begin
regWrite=1;
regDst=1;
memWrite=1'bx;//dont care
aluSrc=1;
memtoReg=0;
ALUcontrolD=2'b00;
branchD=0;
end

6'b101011://store 43
begin
regWrite=0;
regDst=0;
memWrite=1;
aluSrc=1;
memtoReg=0;
ALUcontrolD=2'b00;
branchD=0;
end

6'b000100://beq instruction
begin
regWrite=0;
regDst=1'bx;
memWrite=0;
aluSrc=0;
memtoReg=1'bx;
ALUcontrolD=2'b10;
branchD=1;
end

6'b001000://bne instruction
begin
regWrite=0;
regDst=1'bx;
memWrite=0;
aluSrc=0;
memtoReg=1'bx;
ALUcontrolD=2'b11;
branchD=1;
end

endcase
end

end

endmodule
