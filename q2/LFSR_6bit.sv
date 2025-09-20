module LFSR_6bit (
  input  logic clk, rst_n,
  input  logic sel,
  input  logic [5:0] parallel_in,
  output logic [5:0] parallel_out
);
  logic [5:0] q;

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      q <= '0;
    end
    else if (sel == 1'b0) begin
      q <= parallel_in;
    end
    else begin
      q <= { (q[5] ^ q[4]), q[5:1] };
    end
  end

  assign parallel_out = q;

endmodule

