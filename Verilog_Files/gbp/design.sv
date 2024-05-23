// Code your design here
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:53:59 12/03/2018 
// Design Name: 
// Module Name:    globalBranchPredictor 
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
module globalBranchPredictor(branch,update,prediction);

input branch,update;
output reg prediction;

reg [10:0] historyReg;
reg [31:0]count;

reg foundState;

always @(*)
begin
	if((update == 1'b0)&&(branch == 1'b1))begin
		if(count === 32'bx)begin
			count=32'b0;
			historyReg[0] = 0;
			prediction = 1'b0; //branch will not be taken
		end
	
		else if(count == 1) begin
			historyReg[1] = historyReg[0];
			prediction = historyReg[1];
		end
	
		else if(count == 2) begin
			zeroOrderPredictor(count,prediction);	
			historyReg[2] = prediction;
		end	
			
		else if( (count > 2) &&(count <= 4) )begin
			firstOrderPredictor(count,prediction,foundState);
			if(foundState == 1'b0)
				zeroOrderPredictor(count,prediction);	
			updateHistory(count,prediction);
		end
	
		else begin
			secondOrderPredictor(count,prediction,foundState);
			if(foundState == 1'b0)begin
				firstOrderPredictor(count,prediction,foundState);
				if(foundState == 1'b0)
					zeroOrderPredictor(count,prediction);				
			end
			updateHistory(count,prediction);
		end
		count=count+1;
	end
	
	if(update == 1'b1)begin //false prediction complement the prediction
		historyReg[count-1] = !(historyReg[count-1]);
		prediction = historyReg[count-1];
	end
	$display($time," Branch=%b Update=%b historyReg=%b prediction=%b count=%d",branch,update,historyReg,prediction,count);
end//always block

task updateHistory;
input [31:0]count;
input prediction;
integer i;
begin
	i=0;
	if(count <= 10)
		historyReg[count] = prediction;
	else begin
		while(i < 10)begin
			historyReg[i] = historyReg[i+1];
			i=i+1;
		end
			historyReg[i] = prediction;
	end	
end
endtask

//four states 00_01_10_11 From the state find the no.of 1's and no. of 0's 
task 	secondOrderPredictor;
input [31:0]count;
output reg prediction,foundState;
reg [1:0]pattern,finPattern,pattern1,finPattern1;
integer i,random,numberOfOnes,numberOfZeros;
begin
	i=0;
	numberOfZeros=0;
	numberOfOnes=0;
	foundState=1'b0;
	
	if(count>10)
		count=10;
		
	random=count-1;
	pattern = historyReg[random-:2];
	finPattern={pattern[0],pattern[1]};
	
	while( (i+2)<(count-2) )begin
		pattern1 = historyReg[i+:2];
		finPattern1={pattern1[0],pattern1[1]};
		
		if(finPattern == finPattern1)begin
			if(historyReg[i+2] == 1'b0)
				numberOfZeros = numberOfZeros+1;
			else
				numberOfOnes = numberOfOnes+1;
		end
		i=i+1;
	end
	
	if(numberOfOnes != numberOfZeros)begin
		foundState=1'b1;
		if(numberOfOnes > numberOfZeros)
			prediction=1'b1;
		else
			prediction=1'b0;
	end
	else
		foundState=1'b0;
end
endtask

//two states 0 and 1 From the state find the no. of 1's and 0's
task 	firstOrderPredictor;
input [31:0]count;
output reg prediction,foundState;

reg pattern;
integer i,numberOfOnes,numberOfZeros;
begin
	i=0;
	numberOfZeros=0;
	numberOfOnes=0;
	foundState=1'b0;
	if(count>10)
		count=10;
		
	pattern=historyReg[count-1];
	
	while(i<count-2)begin
		if(pattern == historyReg[i])begin
			if(historyReg[i+1] == 1'b0)
				numberOfZeros = numberOfZeros+1;
			else
				numberOfOnes = numberOfOnes+1;
		end
		i=i+1;
	end
	
	if(numberOfOnes != numberOfZeros)begin
		foundState=1'b1;
		if(numberOfOnes > numberOfZeros)
			prediction=1'b1;
		else
			prediction=1'b0;
	end
	else
		foundState=1'b0;
end
endtask

//find the relative no. of 1's and 0's
task 	zeroOrderPredictor;
input [31:0]count;
output reg prediction;
integer i,numberOfOnes,numberOfZeros;
begin
	i=0;
	numberOfZeros=0;
	numberOfOnes=0;
	
	if(count>10)
		count=10;
		
	while(i <= (count-1))begin
		if(historyReg[i] == 1'b1)
			numberOfOnes = numberOfOnes+1;
		else
			numberOfZeros = numberOfZeros+1;
		i=i+1;
	end
	if(numberOfOnes >= numberOfZeros)
		prediction=1'b1;
	else
		prediction=1'b0;
end
endtask

endmodule
