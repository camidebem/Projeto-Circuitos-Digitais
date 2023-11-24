module counter(//responsavel por verificar a contagem ate 5
	input wire clk, rstn, en,
	output reg [6:0] count
);
always@(posedge clk, negedge rstn)
	begin
		if(!rstn)
			count <= 7'b0000000;
		else if(en)
			count <= (count < 5) ? count + 1'b1 : 5;
	end
endmodule
