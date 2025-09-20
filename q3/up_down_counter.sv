module up_down_counter #(parameter N = 4)
                       (input  logic clk,
                        input  logic rst_n,
                        input  logic up_down,
                        input  logic load,
                        input  logic [N-1:0] input_load,
                        output logic [N-1:0] count_out,
                        output logic carry_out);
  
logic [N-1:0] Q;
localparam logic [N-1:0] MAX = {N{1'b1}};

always_ff @(posedge clk or negedge rst_n)begin
if(!rst_n)begin
	Q <= '0;
      	carry_out <= 1'b0;
end
else if(load)begin
	Q <= input_load;
	carry_out <= 1'b0;
	end 
else if(up_down) begin
	if(Q == MAX)begin
		Q <= '0;
		carry_out <= 1'b1;
	end
	else begin
		Q <= Q + 1'b1;
		carry_out <= 1'b0;
	end	
end	
else begin
	if(Q == '0)begin
		Q <= MAX;
		carry_out <= 1'b1;
	end
	else begin
		Q <= Q - 1'b1;
		carry_out <= 1'b0;
	end	
end	

end

assign count_out = Q;



endmodule
