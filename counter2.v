module counter2(//responsavel por verificar os milesimos de segundo
	input wire clk, rstn, en,
	output reg [9:0] count
);
always@(posedge clk, negedge rstn)
	begin
		if(!rstn)
			count <= 9'b000000000;
		else if(en)
			count <= (count < 1_000) ? count + 1'b1 : 0;
	end
endmodule
