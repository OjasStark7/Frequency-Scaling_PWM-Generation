//PWM Generator
//Inputs : clk_1MHz, pulse_width
//Output : clk_500Hz, pwm_signal

module pwm_generator(
    input clk_1MHz,
    input [3:0] pulse_width,
    output reg clk_500Hz, pwm_signal
);

initial begin
    clk_500Hz = 1; pwm_signal = 1;
end

reg [9:0] counter = 1023;		// 10-Bit counter (log2(1000) ~ 10)

// Generate 500 Hz clock from 1 MHz clock
always @(posedge clk_1MHz) 
	begin
		if (counter == 999) 
			begin // Toggle output every 25 counts
				clk_500Hz <= ~clk_500Hz; // Toggle the output clock
				counter <= 0;         // Reset the counter
			end
		else 
			begin
				counter <= counter + 1; // Increment counter
			end
	end
	
reg [10:0] pwm_counter = 0;         // Counter for PWM Generation (2ms=2000us)

// Generate PWM signal based on 500 Hz clock
always @(posedge clk_1MHz) 
	begin
		if (pwm_counter < 1999)
			begin
				pwm_counter <= pwm_counter + 1; // Increment Counter
			end
		else
			begin
				pwm_counter <= 0; // Reset Counter
			end

		// Set PWM output based on duty cycle if (pwm_counter < pulse_width)
		pwm_signal <= (pwm_counter < (pulse_width * 100)) ? 1 : 0;
	end

endmodule
