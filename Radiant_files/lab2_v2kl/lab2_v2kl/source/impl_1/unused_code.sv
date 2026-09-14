	always_ff (posedge int_osc) begin
		if (reset == 0) begin 
			row <= 4'b0; 
		else if (enable) begin 
			if (count == 24'b0 | count == MAX_COUNT)
				row <= 4'b0001; 
			else if (count == MAX_COUNT/4)
				row <= 4'b0010;
			else if (count == MAX_COUNT/2)
				row <= 4'b0100;
			else if (count == MAX_COUNT/3*4)
				row <= 4'b1000;
			else 
				row <= row; 
			end 
		else 
			row <= row; 
		end