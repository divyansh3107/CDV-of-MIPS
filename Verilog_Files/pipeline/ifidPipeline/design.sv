// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:09:59 04/28/2018 
// Design Name: 
// Module Name:    ifidPipeline 
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
module ifidPipeline(ifidOpcode,hazardflag,opcode,clk);
input [31:0] opcode;
input clk;
input hazardflag;

output reg[31:0] ifidOpcode;

always @(posedge clk)
begin
if(hazardflag) //flush the contents in case of hazard detection
ifidOpcode=32'b0;

else begin 
$write("\n");
$display("Time=%d IFIDpipeline Opcode=%b",$time,opcode);
ifidOpcode=opcode;
end

end
endmodule