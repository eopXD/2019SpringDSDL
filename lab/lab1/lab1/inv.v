module inv(in, out);
	output out;
	input in;
	supply0 a;
	supply1 b;
	nmos(out, a, in);
	pmos(out, b, in);
endmodule

module inv_tb;
	reg in;
	wire out;
	integer k = 0;
	wire x;
	assign x = k;
	wire y, z;
	inv circuit(in, out);
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, inv_tb);
		$display("t=%2d, Test begin", $time);
		$write("This");
		$display(" also", " works.");
		$monitor("t=%2d, in=%d, out=%d, x=%d", $time, in, out, x);
		$display("t=%2d, in=%d, out=%d <- initial status, ", $time, in, out,
			"This is displayed only once");
		$display({2'b10, 2'b11} == 4'o13);
		in = 0;
		#1
		for(k=0; k<8; k=k+1) begin
			in = ~in;
			#1;
		end
	end
endmodule