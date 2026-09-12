`timescale 1 ns/1 ns
module counter #(parameter MAX_COUNT = 120000, parameter WIDTH = 17)(
	input logic reset, 
	input logic enable,
	input logic int_osc,
	output logic [WIDTH-1:0]counter
);

	// MAX_COUNT calculated to blink led[2] at 120 Hz assuming the speed of the clock is 24MHz
	// Counter
   
	always_ff @(posedge int_osc) begin
		if (reset == 0) begin 
			counter <= 0;
			end 
		else if (enable) begin
			if (counter >= MAX_COUNT) begin
				counter <=0;
				end 
			else begin 
				counter <= counter + 1;
				end				
			end
		else begin 
			counter <= counter;
			end 
	end
  
  endmodule 

   
