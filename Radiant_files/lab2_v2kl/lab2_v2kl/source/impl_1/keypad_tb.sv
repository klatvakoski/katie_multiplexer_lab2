`timescale 1 ns/1 ns
module keypad_tb (); 

    // test signals: 
        logic reset;
        logic enable; 
        logic clk;
        logic [3:0]row; 

	always begin
		clk = 0; #2; clk = 1; #2; 
		end 
		
		
    keypad dut (
        .reset(reset),
        .enable(enable), 
        .int_osc(clk), 
        .row(row)
        );


	
	initial begin
	reset = 0; 
	#22; 
	reset = 1;
    enable = 1; 
    #100; 
    assert (row[0] === 1) else $error("keypad failed on row[0]");
    #100;
    assert (row[1] === 1) else $error("keypad failed on row[1]");
    #100;
    assert (row[2] === 1) else $error("keypad failed on row[2]");
    #100;
    assert (row[3] === 1) else $error("keypad failed on row[3]");

    #400 // get the oscillation to not row[0]
    reset = 0; 
	#5;
    assert (dut.count === 0) else $error("keypad failed on reset");
    #22;
    reset = 1; 
    #200; 
    enable = 0; 
    assert (row[1] === 1) else $error("keypad failed on enable");
	#200;
	enable = 1; 
	#200;	// check if the oscillation starts up again
	
	$stop;
	
	end 

endmodule 
	