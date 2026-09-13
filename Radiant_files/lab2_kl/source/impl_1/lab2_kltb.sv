`timescale 1 us/1 ns
module lab2_kltb();
	
	// test signals
     logic reset;
	 logic enable;
	 logic [1:0] chosen_pin;
	 logic [3:0]dip1;
	 logic [3:0]dip2;
	 logic [6:0]seg;
	 	
	lab2_kl dut (
		.reset(reset),
		.enable(enable),
		.dip1(dip1),
		.dip2(dip2),
		.chosen_pin(chosen_pin),
		.seg(seg)
		);
	
	// checking if mux and counter integrate
	initial begin
	reset = 0; 
	#22;
	reset = 1;
	enable = 1;
	dip1 = 4'b1111;
	dip2 = 4'b0000;
	#22; 
	// 0
	assert (dut.chosen_dip === dip1) else $error("choose_pin failed on dip1");
	assert (chosen_pin === 2'b10) else $error("chosen_pin failed on initial dip1");
	
	#8300;
		
	//1
	assert (dut.chosen_dip === dip2) else $error("choose_pin failed on dip2");
	assert (chosen_pin === 2'b01) else $error("chosen_pin failed on initial dip2");

	#8300;
		
	//1
	assert (dut.chosen_dip === dip1) else $error("choose_dip failed on switch back to dip1");
	assert (chosen_pin === 2'b10) else $error("chosen_pin failed on switch back to dip1");
	
	#22
	$stop;
	
	end

endmodule 
	
		