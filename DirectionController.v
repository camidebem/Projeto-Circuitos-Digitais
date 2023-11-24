//Máquina de estados Moore para o jogo tempo de reação.
module DirectionController
(
	input	clk, rstn, button, switch,
	input [6:0] counter5,
	input [9:0] counter1,
	output reg [2:0] data_out
);
	
	// Signal declaration
	reg [2:0] state_reg, state_next;
	
	// Declare states
	localparam [2:0] C = 3'b000, 
	                 I = 3'b001, 
						  S = 3'b010, 
						  T = 3'b100,
						  X = 3'b011;
	
	// state register
	always@(posedge clk, negedge rstn)
		if(!rstn)
			state_reg <= C;
		else
			state_reg <= state_next;
	
	// Moore Output depends only on the state
	always @ (state_reg) 
	begin
		case(state_reg)
			C://Clear
				data_out = 3'b000;
			I://Start
				data_out = 3'b001;
			S://Stop
				data_out = 3'b010;
			T://Saida de tempo
				data_out = 3'b100;
			X://Erro da saida do contador de 5 segundos
				data_out = 3'b011;
			default:
				data_out = 3'b000;
		endcase
	end
	// Determine the next state
	always @ (*)
	begin
		case(state_reg)
			C://Clear
				if(switch) state_next = I; // Se reset não está pressionado vai para I
				else state_next = C;
			I: // Start
				if(button && (counter5 < 5)) state_next = X;
				else if(counter5 >= 5) state_next = S;
				else state_next = C;
			S://Stop
				if(button && (counter1 <= 1_000)) state_next = T;
				else state_next = C;
			T: //Saida tempo
				state_next = T;
			X: //Menor que 5 (saida caso aperte antes da contagem de 5s)
				state_next = X;
			default:
				state_next = C;
		endcase
	end
endmodule
