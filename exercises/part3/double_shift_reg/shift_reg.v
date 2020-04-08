`default_nettype	none
module	shift_reg(i_clk, i_reset, i_ce, i_in, o_bit);
	parameter		LN=8;
    parameter       INITIAL_FILL = { { (LN-1){1'b0}}, 1'b1 };
	input	wire			i_clk, i_reset, i_ce, i_in;
	output	wire			o_bit;

	reg	[(LN-1):0]	sreg;

	initial	sreg = INITIAL_FILL;
	always @(posedge i_clk)
		if (i_reset)
		begin
			sreg <= INITIAL_FILL;
		end else if (i_ce)
		begin
			sreg[(LN-1):0] <= {i_in, sreg[(LN-1):1]};
		end

	assign	o_bit = sreg[0];

endmodule
