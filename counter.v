`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:53:40 08/16/2013 
// Design Name: 
// Module Name:    counter 
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
module counter(
	input clk,
	input rst,
	output reg [7:0] value
    );
	 
reg [27:0] ctr_q, ctr_d;

always @(ctr_q) begin
	ctr_d = ctr_q + 1'b1;
	
	if(ctr_q[27]) begin
		value = ~ctr_q[26:19];
	end else begin
		value = ctr_q[26:19];
	end
end

always @(posedge clk) begin
	
	if(rst) begin
		ctr_q <= 1'b0;
	end else begin
		ctr_q <= ctr_d;
	end
	
end

endmodule