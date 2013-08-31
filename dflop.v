`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:19:20 08/26/2013 
// Design Name: 
// Module Name:    dflop 
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
module dflop(
	input in1,
	input clk,
	output out
    );
	 
reg out;

always @(posedge clk) begin
	out <= in1;
end


endmodule
