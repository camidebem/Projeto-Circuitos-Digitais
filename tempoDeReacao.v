//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module ProjetoPratico(

	//////////// CLOCK //////////
	input 		          		MAX10_CLK1_50,

	//////////// KEY //////////
	input 		     [1:0]		KEY,

	//////////// SW //////////
	input 		     [9:0]		SW,
	
	
	/////////// out da saida para o display //////////
	output		wire     [7:0]		HEX0,
	output		wire     [7:0]		HEX1,
	output		wire	   [7:0]		HEX2,
	output		wire	   [7:0]		HEX3,
	output		wire		[9:0]		LEDR
);

	wire [2:0] data_out;
	reg [4:0] iDIG0;
	reg [4:0] iDIG1;
	reg [4:0] iDIG2;
	reg [4:0] iDIG3;
	wire clk, async_rstn, sync_rstn;
	wire [9:0] numeroContador1;
	wire [6:0] numeroContador5;
	assign clk = MAX10_CLK1_50;
	assign async_rstn = ~SW[9];
	assign LEDR [6:0] = numeroContador5;
	AsyncInputSynchronizer (.clk(clk),
									.asyncn(async_rstn),
									.syncn(sync_rstn));
	DirectionController (.clk(clk),
								.rstn(sync_rstn),
								.switch(SW[0]),
								.button(!KEY[0]),
								.data_out(data_out),
								.counter5(numeroContador5),
								.counter1(numeroContador1)
								);
	SEG7_LUT(.iDIG(iDIG0),
				.oSEG(HEX0));
	SEG7_LUT(.iDIG(iDIG1),
				.oSEG(HEX1));
	SEG7_LUT(.iDIG(iDIG2),
				.oSEG(HEX2));
	SEG7_LUT(.iDIG(iDIG3),
				.oSEG(HEX3));
	
	contador1(.clk(clk),
				 .numero1segundo(numeroContador1),
				 .rstn(sync_rstn),
				 .enableContador1(data_out <= 3'b001 ? 1 : 0)
				);
				
	contador5(.clk(clk),
				 .numero(numeroContador5),
				 .rstn(sync_rstn),
				 .enableContador5(data_out <= 3'b010 ? 1 : 0)
				);
	always @(*) begin
		if (data_out == 3'b000) begin //C clear
			iDIG0 = 5'h01; //Adiciona HI no visor de saida
			iDIG1 = 5'h10;
			iDIG2 = 5'h11;
			iDIG3 = 5'h11;
		end
		else if (data_out == 3'b001 )begin //I Start
			iDIG0 = numeroContador5; //Aparece a contagem no display de 7 segmentos
			iDIG1 = 5'h11;
			iDIG2 = 5'h11;
			iDIG3 = 5'h11;
		end
		else if (data_out == 3'b010)begin //S Stop
			iDIG0 = numeroContador1%10;
			iDIG1 = (numeroContador1%100)/10;
			iDIG2 = (numeroContador1%1000)/100;
			iDIG3 = numeroContador1/1000;
		end
		else if (data_out == 3'b100) begin //T Saida de tempo
			iDIG0 = numeroContador1%10;
			iDIG1 = (numeroContador1%100)/10;
			iDIG2 = (numeroContador1%1000)/100;
			iDIG3 = numeroContador1/1000;
		end
		else if (data_out == 3'b011) begin //X Contador menor que 5
			iDIG0 = 5'h09;
			iDIG1 = 5'h09;
			iDIG2 = 5'h09;
			iDIG3 = 5'h09;
		end
		else begin
			iDIG0 = 5'h11;
			iDIG1 = 5'h11;
			iDIG2 = 5'h11;
			iDIG3 = 5'h11;
		end
	end
endmodule
