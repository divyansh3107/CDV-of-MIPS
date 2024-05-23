`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:48 04/19/2018 
// Design Name: 
// Module Name:    writeback 
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
module writeback(WBresult,WBmemtoReg,WBreaddata,WBaluOut);
input WBmemtoReg;
input [31:0]WBreaddata,WBaluOut;
output [31:0]WBresult;

//to choose between the data from ALU or MEM based on memtoreg control signal.
mux2to1_32bit memORreg(WBresult,WBmemtoReg,WBaluOut,WBreaddata);

endmodule
