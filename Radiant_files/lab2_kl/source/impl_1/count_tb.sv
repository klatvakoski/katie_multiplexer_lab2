`timescale 1 ns/1 ns

module count_tb ();
	// test signals
	logic reset; 
	logic clk;
	logic [3:0] counter;
	logic enable;
	
	//instantiate module with DUT
	counter #(3,3) dut(
		.reset(reset),
		.enable(enable),
		.int_osc(clk),
		.counter(counter)
	); 

	// generate clock
	always
		begin
			clk = 0; #5; clk = 1; #5;
		end 
	
  initial begin
  // reset = 1, enable = 1
  reset = 0; 
  #22 reset = 1; enable = 1; 
  #100;   
   
  // reset = 1, enable = 0
  reset = 0;
  #22 reset = 1; enable = 0; 
  #30;  

// reset = 0, enable = 1
  reset = 0;
  #22 reset = 0; enable = 1; 
	  
  // reset = 0, enable = 0
  reset = 0; enable = 0; 
  #100 $stop;
  end
  
endmodule 