`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:16 04/22/2018 
// Design Name: 
// Module Name:    processor 
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
module processor(clk);
input clk;

wire [31:0]opcode;
wire pcwrite,hazardflag;

reg [31:0] pc=32'b0;

wire [31:0]ifidOpcode;
wire [4:0]idRs,idRt,idRd,exRs,exRt,exRd;			//opcodes of registers rs,rt,rd

wire [4:0]EXwriteReg,MEMwriteReg,WBwriteReg; 	// to maintain rd opcode till writeback stage
wire [31:0]IDimmdValue,EXimmdValue;					//sign extended 32 bit values

wire IDregWrite,IDregDst,IDmemWrite,IDaluSrc,IDmemtoReg;//ctrl signals
/* regWrite:written back to register
	regDst  :destination is rd or rt (in case of load)
	memWrite:written to memory or read
	alusrc  :one of the source is register or immd value
	memtoreg: data is from alu or memory
*/

wire branchD,branchE,ALUzeroOp;//Branch instructions
wire [1:0]ALUcontrolD,ALUcontrolE;
wire PCselectD,PCselectE;
wire [31:0]PCid,PCex;
reg  [1:0]PCselect;

wire predictionId,predictionEx;

wire EXregWrite,EXmemWrite,EXaluSrc,EXmemtoReg,EXregDst;//ex stage		
wire MEMregWrite,MEMmemWrite,MEMmemtoReg;					  //mem stage	
wire WBregWrite,WBmemtoReg;

wire [31:0]idregA,idregB;							 		//read registers in decode stage from register file
wire [31:0]exregA,exregB;

wire [31:0]aluSrcA,aluSrcB,EXwritedata,EXaluOut;	//inputs to alu and output and data of store inst
wire [31:0] MEMaluOut,MEMwritedata,MEMreaddata;    //addr of mem, write and read data from mem
wire [1:0]forwardAE,forwardBE;							//to provide proper inputs to alu during forwarding

wire [31:0]WBreaddata,WBaluOut,WBresult;    		  //final result of write back stage

always @(posedge clk)
begin
if(pcwrite)						//if no hazard then pc=pc+4 to fetch next instruction.
pc=pc+4;
else
pc=pc-32'd4; 				   //to fetch the same instruction again during hazard

if(PCselectD==1 && PCselectE==0)
	PCselect=2'b01;
else if(PCselectD==0 && PCselectE==1)
	PCselect=2'b10;
else if(PCselectD==1 && PCselectE==1)
	PCselect=2'b10;
else
	PCselect=2'b00;

$display($time,"  PCSelect=%b PCselectD=%b PCselectE=%b",PCselect,PCselectD,PCselectE);
case(PCselect)
2'b00:pc=pc;
//Decode
2'b01:pc=PCid;
//Execute
2'b10:pc=PCex;
endcase
end

fetch ft(pc,opcode);//fetch the opcode from inst memory

//IF_ID pipelining
ifidPipeline ifid(ifidOpcode,hazardflag,opcode,clk);

assign idRs[4:0] = ifidOpcode[25:21];											 //fetch the opcode of rs,rt,rd
assign idRt[4:0] = ifidOpcode[20:16];
assign idRd[4:0] = ifidOpcode[15:11];
assign IDimmdValue[31:0] = {{16{ifidOpcode[15]}}, {ifidOpcode[15:0]}};//and immediate value and extend MSB

//detect load hazard
hazardUnit hu(pcwrite,hazardflag,ifidOpcode,idRs,idRt,exRt,EXmemtoReg); 
//control unit to generate control signals
controlUnit ctrlunit(ifidOpcode,PCselectD,PCselectE,IDregWrite,IDregDst,IDmemWrite,IDaluSrc,IDmemtoReg,branchD,ALUcontrolD); 
//Decoding unit. Reading in decoding stage and writing in WB
registerFile rf(WBregWrite,clk,idRs,idRt,idregA,idregB,WBwriteReg,WBresult);

globalBranchPredictor GBP(branchD,1'b0,predictionId);

assign PCselectD = (predictionId == 1)? 1:0;
assign PCid = (PCselectD == 1) ? ((pc-32'd4)+IDimmdValue):pc; 

//ID_EX pipelining
idexPipeline idex(hazardflag,idRs,idRt,idRd,IDimmdValue,idregA,idregB,IDregWrite,IDregDst,IDmemWrite,IDaluSrc,IDmemtoReg,branchD,ALUcontrolD,predictionId,
				 exRs,exRt,exRd,EXimmdValue,exregA,exregB,EXregWrite,EXregDst,EXmemWrite,EXaluSrc,EXmemtoReg,branchE,ALUcontrolE,predictionEx,clk);
//forwarding unit to check data dependencies
forwardingUnit fu(forwardAE,forwardBE,exRs,exRt,MEMwriteReg,WBwriteReg,MEMregWrite,WBregWrite);

/*muxes to choose between the registers as ALU inputs.
order of the parameters: output,ctrl line,inputs*/
mux4to1 muxA(aluSrcA,forwardAE,exregA,WBresult,MEMaluOut,32'b0);
mux4to1 muxB(EXwritedata,forwardBE,exregB,WBresult,MEMaluOut,32'b0);
mux2to1_32bit muxImmdReg(aluSrcB,EXaluSrc,EXwritedata,EXimmdValue);
mux2to1_5bit muxRdRt(EXwriteReg,EXregDst,exRt,exRd);

//alu
execute ex(aluSrcA,aluSrcB,ALUcontrolE,EXaluOut,ALUzeroOp);

assign PCselectE = (predictionEx == ALUzeroOp)? 0:1;
//assign PCex = (PCselectE == 1) ? ((pc-32'd8)+EXimmdValue):pc; 

//Call predictor for updating misprediction
globalBranchPredictor GBP1(branchE,PCselectE,predictionEx);

assign PCex = (PCselectE == 1) ? (predictionEx == 1)?((pc-32'd8)+EXimmdValue):(pc-EXimmdValue) :pc;

//flushIncorrectData FB1(PCselectE,IDregWrite,IDregDst,IDmemWrite,IDaluSrc,IDmemtoReg);

//exmempipeline
exmemPipeline exmem(EXaluOut,EXwritedata,EXwriteReg,EXregWrite,EXmemtoReg,EXmemWrite,
				  MEMaluOut,MEMwritedata,MEMwriteReg,MEMregWrite,MEMmemtoReg,MEMmemWrite,clk);

dataMemory dm(MEMreaddata,MEMmemWrite,MEMaluOut,MEMwritedata);
//memwbpipeline
memwbPipeline memwb(MEMreaddata,MEMaluOut,MEMwriteReg,MEMregWrite,MEMmemtoReg,
				  WBreaddata,WBaluOut,WBwriteReg,WBregWrite,WBmemtoReg,clk);
				  
//write the results back to register file				  
writeback wb(WBresult,WBmemtoReg,WBreaddata,WBaluOut);

endmodule
