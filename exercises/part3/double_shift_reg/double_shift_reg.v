`default_nettype	none
module double_shift_reg(i_clk, i_ce, i_data, o_data);
	input	wire	i_clk, i_ce;
	
	input	wire	i_data;
	output	reg 	o_data;

	wire	a_data, b_data;

	shift_reg	a(i_clk, 1'b0, i_ce, i_data, a_data);
	shift_reg	b(i_clk, 1'b0, i_ce, i_data, b_data);

	initial	o_data = 1'b0;
	always @(posedge i_clk)
		o_data <= a_data ^ b_data;

    `ifdef FORMAL
        // your properties here
        reg [1:0] f_counter = 0;
        always @(posedge i_clk) begin
            // assert the outputs are the same
            assert(!o_data);

            // a trick to flush the registers, useful for when we don't have the licensed tools
            f_counter <= f_counter + 1;
            if(&f_counter)
                assume(i_ce);

            // strongest - but only available with licensed tool
            // assert(a.sreg == b.sreg);
        end
    `endif
endmodule
