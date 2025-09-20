module LFSR_6bit_tb;

  logic clk;
  logic rst_n;
  logic sel;
  logic [5:0] parallel_in;
  logic [5:0] parallel_out;


  LFSR_6bit dut (
    .clk(clk),
    .rst_n(rst_n),
    .sel(sel),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
  );

  initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;   
  end


  initial begin
    rst_n      = 1'b0;
    sel        = 1'b0;
    parallel_in= 6'b0;

    #5  rst_n = 1'b1;               
    #5  sel = 1'b0; parallel_in = 6'b000001;  
    #20 sel = 1'b1;                 
    #60 sel = 1'b0; parallel_in = 6'b101011;  
    #20 sel = 1'b1;              
    #40 $stop;
  end



endmodule
