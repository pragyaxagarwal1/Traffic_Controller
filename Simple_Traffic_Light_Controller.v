module Simple_Traffic_Light_Controller (
    input clk,           // Clock input
    input reset,         // Asynchronous reset
    output reg [2:0] NS, // North-South lights [Red, Yellow, Green]
    output reg [2:0] EW  // East-West lights [Red, Yellow, Green]
);

// Define states
parameter NS_Green_EW_Red = 1'b0;
parameter NS_Red_EW_Green = 1'b1;

reg state;
reg [3:0] timer;

parameter MAX_TIME = 5; // duration of each light

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= NS_Green_EW_Red;
        timer <= 0;
    end else begin
        if (timer < MAX_TIME)
            timer <= timer + 1;
        else begin
            timer <= 0;
            state <= ~state; // toggle state
        end
    end
end

// Output logic
always @(*) begin
    case (state)
        NS_Green_EW_Red: begin
            NS = 3'b001; // Green
            EW = 3'b100; // Red
        end
        NS_Red_EW_Green: begin
            NS = 3'b100; // Red
            EW = 3'b001; // Green
        end
    endcase
end

endmodule
