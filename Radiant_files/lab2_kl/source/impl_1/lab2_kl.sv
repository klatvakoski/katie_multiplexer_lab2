`timescale 1 ns/1 ns
module lab2_kl(
     input   logic reset,
	 input 	 logic enable, 
	 input	 logic [1:0] choose_pin,
	 input	 logic [3:0]dip1,
	 input	 logic [3:0]dip2,
	 output  logic [6:0]seg
);
   logic [4:0]s;
   logic int_osc; 			//to get clock signal
   
   // Internal high-speed oscillator -- 
   HSOSC #(.CLKHF_DIV(2'b01))
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
   // call display_led module for  the seven-segment mapping
   led_display seven_disp(s,seg);
   
   // call counter module for blinking the led[2]
   led_blinker led2(reset, enable, int_osc, led[2]);
   
   // LED & Dipswitch logic
   assign led[0] = (~s[1] & s[0]) | (s[1] & ~s[0]); 
   assign led[1] = (~s[3] & ~s[2]);  //flipped because dipswitch is on when high

endmodule

// choose which signal s gets 
// alternate between the signals at 100 Hz using choose_pin 