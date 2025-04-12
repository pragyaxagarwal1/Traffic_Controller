module tb_Simple_Traffic_Light_Controller;

reg clk;
reg reset;
wire [2:0] NS;
wire [2:0] EW;

Simple_Traffic_Light_Controller dut (
    .clk(clk),
    .reset(reset),
    .NS(NS),
    .EW(EW)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk; // Clock with 10ns period
end

initial begin
    reset = 1;
    #15;
    reset = 0;
    
    #200 $finish;
end

endmodule
