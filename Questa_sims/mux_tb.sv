`timescale 1 us/1 ns
module lab1_tb();
	// test signals
	logic [3:0]d0,d1,y;
	logic s;
	
	mux #(4) dut (
		.d0(d0),
		.d1(d1),
		.s(s),
		.y(y)
		);
	
	initial begin
	s = 0; 
	#22; 
	// 0
	assert (y === d0) else $error("y failed on s = 0");
		
	s = 1; 
	#22;
	//1
	assert (y === d1) else $error("y failed on s = 1");
	
	end 
	
endmodule