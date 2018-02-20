// helper macros for tests:
`define STRINGIFY(x) `"x`"
`define ASSERT(s, msg) \
    if (!s) \
    begin \
        $display("assertion failed: %s: %s", `STRINGIFY(s), msg); \
    end

`define ASSERT_EQ(a, b, msg) \
    if (a !== b) \
    begin \
        $display("assertion failed: %s [%0b] != %s [%0b]: %s", `STRINGIFY(a), a, `STRINGIFY(b), b, msg); \
    end

// the testbench for this week.
module testbench; 
    reg clk, reset, enable; 
    wire [3:0] count; 
        
    // initialize our component
    challenge U0 ( 
    .clk    (clk), 
    .reset  (reset), 
    .enable (enable), 
    .count  (count) 
    ); 
        
    // configuration & clock driving
    initial begin
        clk = 0; 
        reset = 0; 
        enable = 0; 
    end 
    always    
        #5 clk = !clk; 
    initial begin
        $dumpfile ("testbench.vcd"); 
        $dumpvars; 
    end 

    // the test code!
    initial begin
        reset = 1;
        #10 reset = 0;
        `ASSERT_EQ(count, 0, "reset works");
        enable = 1;
        #10
        `ASSERT_EQ(count, 1, "initial step works");
        #50
        `ASSERT_EQ(count, 6, "counting up works");
        enable = 0;
        #200
        `ASSERT_EQ(count, 6, "disable works");
        enable = 1;
        #90
        `ASSERT_EQ(count, 15, "counts up to 15");
        #10
        `ASSERT_EQ(count, 0, "wraps around");
        $finish; 
    end
        
endmodule
