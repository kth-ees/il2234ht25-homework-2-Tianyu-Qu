module shift_register #(parameter N=4)
                      (input logic clk,
                       input logic rst_n,
                       input logic serial_parallel,
                       input logic load_enable,
                       input logic serial_in,
                       input logic [N-1:0] parallel_in,
                       output logic [N-1:0] parallel_out,
                       output logic serial_out);

logic [N-1:0] Q;

always_ff @( posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		Q <= '0;
	end
	else if(load_enable) begin
		if(serial_parallel == 1'b1) begin
			Q <= parallel_in;
		end
		else begin
			Q <= {serial_in,Q[N-1:1]};
		end	
	end
end


endmodule

