
module digital_dice_roller #(
    parameter int DICE_MAX  = 6,                     // Maximum dice value
    parameter int BIT_WIDTH = $clog2(DICE_MAX) + 1,  // Bit width to represent dice value
    parameter int NUM_DICE  = 2                      // Number of dice
) (
    input  wire                            clk,
    input  wire                            reset,       // Asynchronous reset signal
    input  wire                            button,
    output reg  [(NUM_DICE*BIT_WIDTH)-1:0] dice_values  // Flattened array for dice outputs
);

  typedef enum logic [1:0] {
    IDLE    = 2'b00,
    ROLLING = 2'b01
  } state_t;

  state_t current_state, next_state;

  wire [(NUM_DICE*BIT_WIDTH)-1:0] dice_outputs_flat;
  wire enable_rolling;

  dice_roller #(
      .DICE_MAX (DICE_MAX),
      .BIT_WIDTH(BIT_WIDTH),
      .NUM_DICE (NUM_DICE)
  ) roller_inst (
      .clk(clk),
      .reset(reset),
      .enable(enable_rolling),
      .dice_outputs(dice_outputs_flat)
  );

  always_ff @(posedge clk or negedge reset) begin
    if (!reset) begin
      current_state <= IDLE;
    end else begin
      current_state <= next_state;
    end
  end

  always_comb begin
    next_state = current_state;

    case (current_state)
      IDLE: begin
        if (button) next_state = ROLLING;
      end

      ROLLING: begin
        if (!button) next_state = IDLE;
      end
    endcase
  end

  assign enable_rolling = (current_state == ROLLING);

  always_comb begin
    dice_values = dice_outputs_flat;
  end

endmodule


module dice_roller #(
    parameter int DICE_MAX  = 6,
    parameter int BIT_WIDTH = $clog2(DICE_MAX) + 1,
    parameter int NUM_DICE  = 2
) (
    input  wire                             clk,
    input  wire                             reset,
    input  wire                             enable,
    output logic [(NUM_DICE*BIT_WIDTH)-1:0] dice_outputs
);

  reg [15:0] random_seed[NUM_DICE-1:0];

  always_ff @(posedge clk or negedge reset) begin
    if (!reset) begin
      for (int i = 0; i < NUM_DICE; i++) begin
        random_seed[i] <= i + 1;
        dice_outputs[i*BIT_WIDTH+:BIT_WIDTH] <= 1;
      end
    end else if (enable) begin
      for (int i = 0; i < NUM_DICE; i++) begin
        random_seed[i] <= {
          random_seed[i][5] ^ random_seed[i][4] ^ random_seed[i][3] ^ random_seed[i][0],
          random_seed[i][15:1]
        };
        dice_outputs[i*BIT_WIDTH+:BIT_WIDTH] <= (random_seed[i] % DICE_MAX) + 1;
      end
    end
  end

endmodule
