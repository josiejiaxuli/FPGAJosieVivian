module STM_CLK (clock_in, clock_out, clock_out_div2, clock_out_div3_33, clock_out_div3_50, clock_pll);

	input clock_in;
	output clock_out, clock_out_div2, clock_out_div3_33, clock_out_div3_50, clock_pll;
	
	reg[1:0] count = 2'd0;
	
	//clock_out is a copy of clock_in (to display as reference on the oscilloscope)
	assign clock_out = clock_in;

	// clock division by 2
	reg clock_out_div2 = 1;
	always @ (posedge clock_in)
	clock_out_div2 <= ~clock_out_div2;

	// clock division by 3 with 33% duty cycle
	reg clock_out_div3_33 = 0;
	always @ (posedge clock_in) begin
	if (count == 2'd0)
		begin
			clock_out_div3_33 <= ~clock_out_div3_33;
		end
	else if (count == 2'd1)
		begin
			clock_out_div3_33 <= ~clock_out_div3_33;
		end
	count <= count + 1;
	if (count == 2'd3)
		begin
			count <= 2'd0;
		end
	end
	
	// assign clock_out_div3_33 = 0;

	//clock division by 3 with 50% duty cycle
	// TODO
	assign clock_out_div3_50 = 0;

	//clock division using the Altera PLL IP
	// TODO
	assign clock_pll = 0;

endmodule