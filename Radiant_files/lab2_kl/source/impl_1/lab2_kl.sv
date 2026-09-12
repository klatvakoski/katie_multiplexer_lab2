`timescale 1 ns/1 ns
module lab2_kl(
     input   logic reset,
	 input 	 logic enable, 
	 input	 logic [1:0] choose_pin,
	 input	 logic [3:0]dip1,
	 input	 logic [3:0]dip2,
	 output  logic [6:0]seg
);
   localparam MAX_COUNT = 120000;
   localparam WIDTH = 17;
   logic s;
   logic [3:0]chosen_dip; 
   logic [WIDTH:0] count; 
   logic int_osc; 						//to get clock signal
    
   
   // Internal high-speed oscillator -- 
   HSOSC #(.CLKHF_DIV(2'b01))
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	// call counter module for switching between the two LED segments
   counter counting(reset, enable, int_osc, count);
   // flip s based on the counting module. Then it can choose dip1 or dip2
   always_comb begin 
	   s <= 0; 
	   if (count >= MAX_COUNT)
		   s <= ~s;
	   else 
		   s <= s; 
	end 
	// use a mux to choose which dip switch we're taking from
	mux #(4) choose_dip(dip1,dip2,s,chosen_dip);
	
   // call display_led module for the seven-segment mapping
   led_display seven_disp(chosen_dip,seg);
   

endmodule
