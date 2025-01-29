module fs_pwm_bdf(
	clk_50MHz,
	pulse_width,
	pwm_signal,
	clk_500Hz,
	clk_1MHz
);


input wire	clk_50MHz;
input wire	[3:0] pulse_width;
output wire	pwm_signal;
output wire	clk_500Hz;
output wire	clk_1MHz;

wire	SYNTHESIZED_WIRE_0;

assign	clk_1MHz = SYNTHESIZED_WIRE_0;




frequency_scaler	b2v_inst(
	.clk_50MHz(clk_50MHz),
	.clk_1MHz(SYNTHESIZED_WIRE_0));


pwm_generator	b2v_inst1(
	.clk_1MHz(SYNTHESIZED_WIRE_0),
	.pulse_width(pulse_width),
	.clk_500Hz(clk_500Hz),
	.pwm_signal(pwm_signal));


endmodule
