module shift_register_tb;

localparam int N = 4;

logic clk; 
logic rst_n; 
logic serial_parallel; 
logic load_enable; 
logic serial_in; 
logic [N-1:0] parallel_in; 
logic [N-1:0] parallel_out;
logic serial_out; 



shift_register #(.N(N)) LUT(
.clk(clk),
.rst_n(rst_n), 
.serial_parallel(serial_parallel), 
.load_enable(load_enable),
.serial_in(serial_in),
.parallel_in(parallel_in), 
.parallel_out(parallel_out),
.serial_out(serial_out) 
); 


initial begin
clk = 1'b0;
forever #5 clk =~clk;
end

initial begin
rst_n = 1'b0;
serial_parallel = 1'b0;
load_enable = 1'b0;
serial_in = 1'b0;
parallel_in = 4'b0;

#5 rst_n = 1'b1;
#5 load_enable = 1'b1; serial_in = 1'b1;
#40 serial_parallel = 1'b1; parallel_in = 4'b0;
#20 $stop;
end

endmodule
