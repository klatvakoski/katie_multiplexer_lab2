module keypad(
	input   logic reset,
	input 	logic enable, 
	input	logic int_osc, 
	output	logic [3:0]row
	); 
	
	localparam MAX_COUNT = 120; //6000000;
	localparam WIDTH = 8; //24;
	logic [WIDTH-1:0] count; 
	
	counter #(MAX_COUNT,WIDTH) counting(reset, enable, int_osc, count);

	assign row[0] = (count >= 24'b0 & count < MAX_COUNT/4) | (count == MAX_COUNT);
	assign row[1] = (count >= MAX_COUNT/4 & count < MAX_COUNT/2);
	assign row[2] = (count >= MAX_COUNT/2 & count < (MAX_COUNT*3)/4);
	assign row[3] = (count >= (MAX_COUNT*3)/4 & count < MAX_COUNT);
	
	

endmodule
			
			
	
	