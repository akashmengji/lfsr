module tb_lfsr_16bit;

  // Inputs
  reg         clock;
  reg         reset;
  reg  [15:0] lfsr_seed;
  reg         sel;  // Selector for NAND or NOR operation
  reg         dir;  // Direction control (0: LSB to MSB, 1: MSB to LSB)
  reg  [ 3:0] weight;  // Weight control signal

  // Outputs
  wire [15:0] lfsr_new;

  lfsr_16bit dut (
      .clock(clock),
      .reset(reset),
      .lfsr_seed(lfsr_seed),
      .sel(sel),
      .dir(dir),
      .weight(weight),
      .lfsr_new(lfsr_new)
  );

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  initial begin
    $monitor("Time=%0t | lfsr_new =%b | lfsr_seed=%b | sel=%b | dir=%b | weight=%b", $time,
             lfsr_new, lfsr_seed, sel, dir, weight);

    test_case(16'hAAAA, 0, 0, 4'b0000);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b0001);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b0010);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b0011);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b0100);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b0101);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b0110);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b0111);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b1000);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b1001);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b1010);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b1011);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b1100);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b1101);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b1110);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 0, 4'b1111);
    run_lfsr(5);

    test_case(16'hAAAA, 0, 1, 4'b0000);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b0001);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b0010);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b0011);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b0100);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b0101);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b0110);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b0111);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b1000);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b1001);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b1010);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b1011);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b1100);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b1101);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b1110);
    run_lfsr(5);
    test_case(16'hAAAA, 0, 1, 4'b1111);
    run_lfsr(5);

    test_case(16'hAAAA, 1, 0, 4'b0000);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b0001);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b0010);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b0011);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b0100);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b0101);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b0110);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b0111);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b1000);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b1001);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b1010);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b1011);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b1100);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b1101);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b1110);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 0, 4'b1111);
    run_lfsr(5);

    test_case(16'hAAAA, 1, 1, 4'b0000);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b0001);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b0010);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b0011);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b0100);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b0101);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b0110);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b0111);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b1000);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b1001);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b1010);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b1011);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b1100);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b1101);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b1110);
    run_lfsr(5);
    test_case(16'hAAAA, 1, 1, 4'b1111);
    run_lfsr(5);
    $finish;
  end


  task test_case(input [15:0] seed, input sel_val, input dir_val, input [3:0] weight_val);
    begin
      reset = 1;
      lfsr_seed = seed;
      sel = sel_val;
      dir = dir_val;
      weight = weight_val;
      #10 reset = 0;

      if (!reset) begin
        // $display("Reset is low, output assigned to seed value: %h", lfsr_seed);
      end
      #10 reset = 1;  // Release reset
    end
  endtask

  task run_lfsr(input integer num_cycles);
    begin
      repeat (num_cycles) @(posedge clock);
    end
  endtask

endmodule
