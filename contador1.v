//=======================================================
//  This code is generated by Terasic System Builder
//=======================================================

module contador1(

	//////////// CLOCK //////////
	input 		          		clk,
	input								enableContador1,

	//////////// SEG7 //////////
	output			  [9:0]   numero1segundo,

	//////////// KEY //////////
	input 		     			rstn
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

  wire clock_out_divisor;
  


//=======================================================
//  Structural coding
//=======================================================

  
  divisor1segundo div (
    .clock_in(clk),
    .reset_n(rstn),
    .enable(enableContador1),
    .clock_out(clock_out_divisor)
  );
  
  counter2 cnt (
    .clk(clk),
    .rstn(rstn),
    .en(clock_out_divisor),
    .count(numero1segundo)
  );
  
endmodule
