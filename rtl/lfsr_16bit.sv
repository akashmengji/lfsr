
module lfsr_16bit (
    input clock,
    input reset,
    input [15:0] lfsr_seed,
    input sel,  // Selector for NAND or NOR operation (0: NOR for more 0s, 1: NAND for more 1s)
    input dir,  // Direction control (0: LSB to MSB, 1: MSB to LSB)
    input [4:0] weight,  // Weight control signal
    output reg [15:0] lfsr_new

);
  wire q1;
  wire q2;
  wire q3;
  reg [15:0] int_reg;
  reg [15:0] lfsr_reg;

  assign q1 = lfsr_reg[6] ^ lfsr_reg[0];
  assign q2 = lfsr_reg[5] ^ lfsr_reg[0];
  assign q3 = lfsr_reg[1] ^ lfsr_reg[0];


  always @* begin
    int_reg = lfsr_reg;

    if (sel == 0 && dir == 0) begin
      case (weight)
        4'b0000: int_reg = lfsr_reg;
        4'b0001: int_reg = {lfsr_reg[15:1], ~(lfsr_reg[0] | 1'b1)};
        4'b0010:
        int_reg = {int_reg[15:2], ~(lfsr_reg[1] | lfsr_reg[0]), ~(lfsr_reg[1] | lfsr_reg[0])};
        4'b0011:
        int_reg = {
          lfsr_reg[15:3],
          ~(lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b0100:
        int_reg = {
          int_reg[15:4],
          ~(lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b0101:
        int_reg = {
          lfsr_reg[15:5],
          ~(lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b0110:
        int_reg = {
          int_reg[15:6],
          ~(lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b0111:
        int_reg = {
          int_reg[15:7],
          ~(lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b1000:
        int_reg = {
          int_reg[15:8],
          ~(lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b1001:
        int_reg = {
          int_reg[15:9],
          ~(lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b1010:
        int_reg = {
          int_reg[15:10],
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])

        };
        4'b1011:
        int_reg = {
          int_reg[15:11],
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b1100:
        int_reg = {
          int_reg[15:12],
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b1101:
        int_reg = {
          int_reg[15:13],
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b1110:
        int_reg = {
          int_reg[15:14],
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])
        };
        4'b1111:
        int_reg = {
          int_reg[15],
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0]),
          ~(lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1] | lfsr_reg[0])

        };
      endcase
    end else if (sel == 0 && dir == 1) begin
      case (weight)
        4'b0000: int_reg = lfsr_reg;
        4'b0001: int_reg = {~(lfsr_reg[15] | 1'b0), lfsr_reg[14:0]};
        4'b0010:
        int_reg = {~(lfsr_reg[15] | lfsr_reg[14]), ~(lfsr_reg[15] | lfsr_reg[14]), lfsr_reg[13:0]};
        4'b0011:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13]),

          lfsr_reg[12:0]
        };
        4'b0100:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12]),
          lfsr_reg[11:0]
        };
        4'b0101:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11]),
          lfsr_reg[10:0]
        };
        4'b0110:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10]),
          lfsr_reg[9:0]
        };
        4'b0111:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9]),
          lfsr_reg[8:0]
        };
        4'b1000:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8]),
          lfsr_reg[7:0]
        };
        4'b1001:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7]),
          lfsr_reg[6:0]
        };
        4'b1010:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6]),
          lfsr_reg[5:0]
        };
        4'b1011:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5]),
          lfsr_reg[4:0]
        };
        4'b1100:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4]),
          lfsr_reg[3:0]
        };
        4'b1101:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3]),
          lfsr_reg[2:0]
        };
        4'b1110:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2]),
          lfsr_reg[1:0]
        };
        4'b1111:
        int_reg = {
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          ~(lfsr_reg[15] | lfsr_reg[14] | lfsr_reg[13] | lfsr_reg[12] | lfsr_reg[11] | lfsr_reg[10] | lfsr_reg[9] | lfsr_reg[8] | lfsr_reg[7] | lfsr_reg[6] | lfsr_reg[5] | lfsr_reg[4] | lfsr_reg[3] | lfsr_reg[2] | lfsr_reg[1]),
          lfsr_reg[0]
        };
      endcase
    end else if (sel == 1 && dir == 0) begin
      case (weight)
        4'b0000: int_reg = lfsr_reg;
        4'b0001: int_reg = {lfsr_reg[15:1], ~(lfsr_reg[0] & 1'b1)};
        4'b0010:
        int_reg = {int_reg[15:2], ~(lfsr_reg[1] & lfsr_reg[0]), ~(lfsr_reg[1] & lfsr_reg[0])};
        4'b0011:
        int_reg = {
          lfsr_reg[15:3],
          ~(lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b0100:
        int_reg = {
          int_reg[15:4],
          ~(lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b0101:
        int_reg = {
          lfsr_reg[15:5],
          ~(lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b0110:
        int_reg = {
          int_reg[15:6],
          ~(lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b0111:
        int_reg = {
          int_reg[15:7],
          ~(lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b1000:
        int_reg = {
          int_reg[15:8],
          ~(lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b1001:
        int_reg = {
          int_reg[15:9],
          ~(lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b1010:
        int_reg = {
          int_reg[15:10],
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])

        };
        4'b1011:
        int_reg = {
          int_reg[15:11],
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b1100:
        int_reg = {
          int_reg[15:12],
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b1101:
        int_reg = {
          int_reg[15:13],
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b1110:
        int_reg = {
          int_reg[15:14],
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])
        };
        4'b1111:
        int_reg = {
          int_reg[15],
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0]),
          ~(lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1] & lfsr_reg[0])

        };
      endcase
    end else if (sel == 1 && dir == 1) begin
      case (weight)
        4'b0000: int_reg = lfsr_reg;
        4'b0001: int_reg = {~(lfsr_reg[15] & 1'b0), lfsr_reg[14:0]};
        4'b0010:
        int_reg = {~(lfsr_reg[15] & lfsr_reg[14]), ~(lfsr_reg[15] & lfsr_reg[14]), lfsr_reg[13:0]};
        4'b0011:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13]),

          lfsr_reg[12:0]
        };
        4'b0100:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12]),
          lfsr_reg[11:0]
        };
        4'b0101:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11]),
          lfsr_reg[10:0]
        };
        4'b0110:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10]),
          lfsr_reg[9:0]
        };
        4'b0111:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9]),
          lfsr_reg[8:0]
        };
        4'b1000:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8]),
          lfsr_reg[7:0]
        };
        4'b1001:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7]),
          lfsr_reg[6:0]
        };
        4'b1010:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6]),
          lfsr_reg[5:0]
        };
        4'b1011:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5]),
          lfsr_reg[4:0]
        };
        4'b1100:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4]),
          lfsr_reg[3:0]
        };
        4'b1101:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3]),
          lfsr_reg[2:0]
        };
        4'b1110:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2]),
          lfsr_reg[1:0]
        };
        4'b1111:
        int_reg = {
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          ~(lfsr_reg[15] & lfsr_reg[14] & lfsr_reg[13] & lfsr_reg[12] & lfsr_reg[11] & lfsr_reg[10] & lfsr_reg[9] & lfsr_reg[8] & lfsr_reg[7] & lfsr_reg[6] & lfsr_reg[5] & lfsr_reg[4] & lfsr_reg[3] & lfsr_reg[2] & lfsr_reg[1]),
          lfsr_reg[0]
        };
      endcase
    end
  end

  always_ff @(posedge clock) begin
    if (!reset) lfsr_reg <= lfsr_seed;
    else begin
      lfsr_reg <= {
        lfsr_reg[0],
        lfsr_reg[15],
        lfsr_reg[14],
        lfsr_reg[13],
        lfsr_reg[12],
        lfsr_reg[11],
        lfsr_reg[10],
        lfsr_reg[9],
        lfsr_reg[8],
        lfsr_reg[7],
        q1,
        q2,
        lfsr_reg[4],
        lfsr_reg[3],
        lfsr_reg[2],
        q3
      };
      lfsr_new <= int_reg;
    end
  end
endmodule
