// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:27 05/01/2018 
// Design Name: 
// Module Name:    mux4to1 
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
module mux4to1(out,ctrl,in1,in2,in3,in4);
input [1:0]ctrl;
input [31:0]in1,in2,in3,in4;
output reg [31:0]out;

always @(in1,in2,in3,in4,ctrl)
begin
case(ctrl)
2'b00:out=in1;
2'b01:out=in2;
2'b10:out=in3;
2'b11:out=in4;
endcase
end

endmodule
