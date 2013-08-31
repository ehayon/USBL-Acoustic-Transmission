module mojo_top(
    input clk,
    input rst_n,
    input cclk,
    output[7:0]led,
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output [3:0] spi_channel,
    input avr_tx,
    output avr_rx,
    input avr_rx_busy,
	 output sig_out
    );

wire rst = ~rst_n;

wire [7:0] compare;

assign out1 = 1'b0;
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;


wave #(.CTR_LEN(25)) led_wave (
	.rst(rst),
	.clk(clk),
	.led(led)
);

acoustic_pulse_train acoustic_pt (
	.rst(rst),
	.clk(clk),
	.signal(sig_out)
);

endmodule
