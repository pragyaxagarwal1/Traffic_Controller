module Traffic_Light_Controller (
    input clk,             // Clock signal
    input reset,           // Asynchronous Reset
    output reg [2:0] NS,   // North-South: [Red, Yellow, Green]
    output reg [2:0] EW    // East-West:   [Red, Yellow, Green]
);

// State Encoding using parameters (instead of SystemVerilog typedef)
parameter NS_GREEN_EW_RED   = 2'b00;
parameter NS_YELLOW_EW_RED  = 2'b01;
parameter NS_RED_EW_GREEN   = 2'b10;
parameter NS_RED_EW_YELLOW  = 2'b11;

reg [1:0] current_state, next_state;

// Timer (counter for state duration)
reg [3:0] timer; // 4-bit counter (0-15)

parameter GREEN_TIME = 5;
parameter YELLOW_TIME = 2;

// Sequential logic for state transitions and timer
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= NS_GREEN_EW_RED;
        timer <= 0;
    end else begin
        case (current_state)
            NS_GREEN_EW_RED, NS_RED_EW_GREEN: begin
                if (timer < GREEN_TIME)
                    timer <= timer + 1;
                else begin
                    timer <= 0;
                    current_state <= next_state;
                end
            end
            NS_YELLOW_EW_RED, NS_RED_EW_YELLOW: begin
                if (timer < YELLOW_TIME)
                    timer <= timer + 1;
                else begin
                    timer <= 0;
                    current_state <= next_state;
                end
            end
        endcase
    end
end

// Next State Logic
always @(*) begin
    case (current_state)
        NS_GREEN_EW_RED:
            next_state = (timer >= GREEN_TIME) ? NS_YELLOW_EW_RED : NS_GREEN_EW_RED;

        NS_YELLOW_EW_RED:
            next_state = (timer >= YELLOW_TIME) ? NS_RED_EW_GREEN : NS_YELLOW_EW_RED;

        NS_RED_EW_GREEN:
            next_state = (timer >= GREEN_TIME) ? NS_RED_EW_YELLOW : NS_RED_EW_GREEN;

        NS_RED_EW_YELLOW:
            next_state = (timer >= YELLOW_TIME) ? NS_GREEN_EW_RED : NS_RED_EW_YELLOW;

        default:
            next_state = NS_GREEN_EW_RED;
    endcase
end

// Output Logic
always @(*) begin
    case (current_state)
        NS_GREEN_EW_RED: begin
            NS = 3'b001; // Green
            EW = 3'b100; // Red
        end
        NS_YELLOW_EW_RED: begin
            NS = 3'b010; // Yellow
            EW = 3'b100; // Red
        end
        NS_RED_EW_GREEN: begin
            NS = 3'b100; // Red
            EW = 3'b001; // Green
        end
        NS_RED_EW_YELLOW: begin
            NS = 3'b100; // Red
            EW = 3'b010; // Yellow
        end
        default: begin
            NS = 3'b100; // Default all red
            EW = 3'b100;
        end
    endcase
end

endmodule

