`timescale 1 us/1 us
module lab2_keypad_tb (); 

    // test signals: 
        logic reset;
		logic enable;
		logic [3:0]col;
		logic [3:0]row;
		logic [3:0]led;

	lab2_keypad dut(
		.reset(reset),
		.enable(enable), 
		.col(col),
		.row(row),
		.led(led)
	);

	initial begin
	reset = 1;
    enable = 1; 
	col = 4'b1110;
    #22; 
    assert (led[0] === 1) else $error("keypad failed on led[0]");
	#22; 
	
	col = 4'b1101; 
	#22; 
    assert (led[1] === 1) else $error("keypad failed on led[1]");
    #22;
	
	col = 4'b1011;
	#22;
    assert (led[2] === 1) else $error("keypad failed on led[2]");
    #22;
	
	col = 4'b0111;
	#22;
    assert (led[3] === 1) else $error("keypad failed on led[3]");
    #22;
	
	$stop;
	
	end 

endmodule 
	