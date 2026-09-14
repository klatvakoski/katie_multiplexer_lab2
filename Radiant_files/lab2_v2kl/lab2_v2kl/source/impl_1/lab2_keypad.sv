`timescale 1 us/1 ns
module lab2_keypad(
     input   logic reset,
	 input 	 logic enable, 
	 input	 logic [3:0]col,
	 output	 logic [3:0]row,
	 output	 logic [3:0]led
);

   //localparam WIDTH = 24;
   //logic [WIDTH-1:0] count; 
   logic int_osc; 						//to get clock signal
    
   
   // Internal high-speed oscillator -- 
   HSOSC #(.CLKHF_DIV(2'b01))
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
   
   // call keypad module
   keypad key(reset, enable, clk, col, row, led);
   
assign led[3:0] = ~col[3:0]; 
   

endmodule
