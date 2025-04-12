`timescale 1ns / 1ps

module Traffic_Light_Controller_tb;

    reg clk;
    reg reset;
    wire [2:0] NS;
    wire [2:0] EW;

    // Instantiate the traffic controller
    Traffic_Light_Controller uut (
        .clk(clk),
        .reset(reset),
        .NS(NS),
        .EW(EW)
    );

    // Generate clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;

        // Hold reset high for a few cycles
        #15 reset = 0;

        // Run the simulation for some time
        #200 $stop;
    end

    // Monitor output at every clock edge
    always @(posedge clk) begin
        $display("Time: %0t | NS: %b | EW: %b", $time, NS, EW);
    end

endmodule
