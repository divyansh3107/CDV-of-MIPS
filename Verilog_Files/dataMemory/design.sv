// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:18 05/01/2018 
// Design Name: 
// Module Name:    dataMemory 
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
module dataMemory(readdata,memWrite,address,writedata);
input memWrite;
input [31:0]address,writedata;

reg[31:0]datamemory[15:0];//Data memory. 16 locations with 32 bits each.
output reg [31:0]readdata;

always @(memWrite,address,writedata)
begin

if(memWrite)begin
datamemory[address]=writedata;
//$display("Data Written is :%d",writedata);
end

else begin
readdata=datamemory[address];
//$display("Data read from MEM is :%d",readdata);
end

end

endmodule