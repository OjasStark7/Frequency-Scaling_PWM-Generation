//Frequency Scaling
//Inputs : clk_50MHz
//Output : clk_1MHz

module frequency_scaler (
    input clk_50MHz,
    output reg clk_1MHz
);

initial begin
    clk_1MHz = 1;
end

reg [4:0] counter=31; // 5-bit counter (log2(25) ~ 5)	
always @(posedge clk_50MHz) 
	begin
		if (counter == 24) 
			begin // Toggle output every 25 counts
				clk_1MHz <= ~clk_1MHz; // Toggle the output clock
				counter <= 0;         // Reset the counter
			end
		else 
			begin
				counter <= counter + 1; // Increment counter
			end
	end
endmodule
