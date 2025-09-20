module up_down_counter_tb;
  
localparam int N = 4;

logic clk;
logic rst_n;
logic up_down;
logic load;
logic [N-1:0] input_load;
logic [N-1:0] count_out;
logic carry_out;



up_down_counter #(.N(N)) LUT(
.clk(clk),
.rst_n(rst_n), 
.up_down(up_down), 
.load(load),
.input_load(input_load),
.count_out(count_out), 
.carry_out(carry_out)
); 


initial begin
clk = 1'b0;
forever #5 clk =~clk;
end

initial begin
rst_n = 1'b0;
up_down = 1'b0;
load = 1'b0;
input_load = 1'b0;

#10 rst_n = 1'b1;
#10 load = 1'b1; input_load = 4'b0111;
#10 load = 1'b0; up_down = 1'b1;
#110 load = 1'b1;
#10 load = 1'b0; up_down = 1'b0;
#20 $stop;
end



endmodule
