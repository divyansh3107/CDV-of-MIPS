// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:35:32 04/19/2018 
// Design Name: 
// Module Name:    memaccess 
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
module memaccess(memaccess,execute,clk,d,c);
	 
input clk,execute;
input [1:0]c;
output reg memaccess;
output reg [1:0]d;

initial
begin
d=0; 
end

always@(posedge clk)
begin

if(execute)begin
$display("$Time =%d  & d=%d Memaccess",$time,d);
memaccess=1;
d=c;
end

end
endmodule