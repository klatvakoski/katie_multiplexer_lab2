`timescale 1 ns/1 ns
module counter #(parameter p = 5000000, parameter w = 25)(
	input logic reset, 
	input logic enable,
	input logic int_osc,
	output logic led
);

// outputs a digit at a frequency of 2.4 Hz
	logic [w-1:0] counter; 
	// p calculated to blink led[2] at 2.4 Hz assuming the speed of the clock is 24MHz
	// Counter
   
	always_ff @(posedge int_osc) begin
		if (reset == 0) begin 
			counter <= 0;
			led <= 0;			// LED = 0 at the beginning
			end 
		else if (enable) begin
			if (counter >= p) begin
				counter <=0;
				led <= ~led;	// fip LED
				end 
			else begin 
				counter <= counter + 1;
				led <= led;		// LED stays same
				end				
			end
		else begin 
			counter <= counter;
			led <= led; 		// LED stays same
			end 
	end
  
  endmodule 

   
