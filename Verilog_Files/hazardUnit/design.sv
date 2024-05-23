// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:00:19 05/01/2018 
// Design Name: 
// Module Name:    hazardUnit 
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
module hazardUnit(pcwrite,hazardflag,ifidOpcode,idRs,idRt,exRt,EXmemtoReg);
input[4:0]idRs,idRt,exRt;
input EXmemtoReg;
input [31:0]ifidOpcode;

output reg pcwrite,hazardflag;

initial
begin
pcwrite=1;
hazardflag=1'b0;
end

always @(idRs,idRt,exRt,EXmemtoReg)
begin
//if memoryTOreg(in case of load) and rs or rt of decode stage is equal to rt of ex stage (stall)
if( ((idRs==exRt)||(idRt==exRt))&&(EXmemtoReg) )
begin
$display("HAZARD DETECTED: idRs=%b idRt=%b exRt=%b",idRs,idRt,exRt);
pcwrite=0;
hazardflag=1'b1;
end

else begin
pcwrite=1;
hazardflag=1'b0;
end

end
endmodule
