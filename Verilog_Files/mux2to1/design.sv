// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:07 05/01/2018 
// Design Name: 
// Module Name:    mux2to1 
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
module mux2to1(out,ctrl,in1,in2);
input ctrl;
input [4:0]in1,in2;
output reg [4:0] out;

always @(ctrl,in1,in2)
begin
case (ctrl)
1'b0:out=in1;
1'b1:out=in2;
endcase
end

endmodule
