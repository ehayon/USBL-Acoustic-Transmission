`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ethan Hayon
// 
// Create Date:    19:46:30 08/30/2013 
// Design Name: 	
// Module Name:    acoustic_pulse_train 
// Project Name:   Perseus II
// Target Devices: Mojo FPGA
// Tool versions: 
// Description:    This will generate 2ms burst of 40KHz square wave, then delay 2s before sending another pulse, so on...
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module acoustic_pulse_train(
	input clk,
	input rst,
	output reg signal
    );
	 
reg [10:0] cntr_q, cntr_d;
reg [26:0] sleep_q, sleep_d;

reg [26:0]compare = 'd100000000;

always @(cntr_q) begin
	cntr_d = cntr_q + 1'b1;
	
	/* reset counter if > 2500 */
	if(cntr_d > 'd1250) begin
		cntr_d = 11'd0;
	end		
end

always @(sleep_q) begin
	sleep_d = sleep_q + 1'b1;
	/* manual overflow for sleep after 2s+2ms seconds */
	if(sleep_d > 'd100010000)
		sleep_d = 27'd0;
end

always @(cntr_q or sleep_q) begin
	if(cntr_d > 'd625)	
		signal = 1'b0;
	else
		signal = 1'b1 & (sleep_q > compare);
end

always @(posedge clk) begin
	if(rst) begin
		cntr_q <= 1'b0;
	end else begin
		cntr_q <= cntr_d;
		sleep_q <= sleep_d;
	end
end


endmodule
