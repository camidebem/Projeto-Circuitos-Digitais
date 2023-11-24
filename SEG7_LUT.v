module SEG7_LUT (
	input wire [4:0] iDIG,
	output reg [6:0] oSEG
);
always @*
	begin
		case(iDIG)
			5'h00: oSEG = 7'b1000000;
			5'h01: oSEG = 7'b1111001;// ---t----
			5'h02: oSEG = 7'b0100100; // | |
			5'h03: oSEG = 7'b0110000; // lt rt
			5'h04: oSEG = 7'b0011001; // | |
			5'h05: oSEG = 7'b0010010; // ---m----
			5'h06: oSEG = 7'b0000010; // | |
			5'h07: oSEG = 7'b1111000; // lb rb
			5'h08: oSEG = 7'b0000000; // | |
			5'h09: oSEG = 7'b0011000; // ---b----
			5'h0a: oSEG = 7'b0001000;
			5'h0b: oSEG = 7'b0000011;
			5'h0c: oSEG = 7'b1000110;
			5'h0d: oSEG = 7'b0100001;
			5'h0e: oSEG = 7'b0000110;
			5'h0f: oSEG = 7'b0001110;
			5'h10: oSEG = 7'b0001001;
			5'h11: oSEG = 7'b1111111;
		default:
			oSEG = 7'b1000000;
		endcase
	end
endmodule
