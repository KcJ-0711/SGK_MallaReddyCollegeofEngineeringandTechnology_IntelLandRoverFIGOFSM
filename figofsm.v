// Quartus Prime Verilog Template
// 4-State Mealy state machine

// A Mealy machine has outputs that depend on both the state and 
// the inputs.  When the inputs change, the outputs are updated
// immediately, without waiting for a clock edge.  The outputs
// can be written more than once per state or per clock cycle.

module figofsm
(
	input	clk, in, reset,
	output reg [3:0] out
);

	// Declare state register
		reg		[3:0]state, next;

	// Declare states
	parameter S0 = 4'b0000, S1 = 4'b0001, S2 = 4'b0101, S3 = 4'b0110, S4 = 4'b0111, S5 = 4'b0011, S6 = 4'b1011, S7 = 4'b1001, S8 = 4'b1101, S9 = 4'b1110, S10 = 4'b1100;

	// Determine the next state synchronously, based on the
	// current state and the input
	always @ (posedge clk or posedge reset) begin
		if (reset)
			state <= S0;
		else
			state <= next;
	end
	
	always @(state or in) begin
		case (state)
				S0:
					if (in)
					begin
						next <= S1;
					end
					else
					begin
						next <= S0;
					end
				S1:
					if (in)
					begin
						next <= S2;
					end
					else
					begin
						next <= S1;
					end
				S2:
					if (in)
					begin
						next <= S7;
					end
					else
					begin
						next <= S3;
					end
				S3:
					if (in)
					begin
						next <= S4;
					end
					else
					begin
						next <= S3;
					end
				S4:
					if (in)
					begin
						next <= S6;
					end
					else
					begin
						next <= S5;
					end
				S7:
					if (in)
					begin
						next <= S8;
					end
					else
					begin
						next <= S7;
					end
				S8:
					if (in)
					begin
						next <= S10;
					end
					else
					begin
						next <= S9;
					end
			endcase
			end

	// Determine the output based only on the current state
	// and the input (do not wait for a clock edge).
	always @ (state or in)
	begin
			case (state)
				S0:
					if (in)
					begin
						out = 4'b0001;
					end
					else
					begin
						out = 4'b0000;
					end
				S1:
					if (in)
					begin
						out = 4'b0101;
					end
					else
					begin
						out = 4'b0001;
					end
				S2:
					if (in)
					begin
						out = 4'b1001;
					end
					else
					begin
						out = 4'b0110;
					end
				S3:
					if (in)
					begin
						out = 4'b0111;
					end
					else
					begin
						out = 4'b0110;
					end
				S4:
					if (in)
					begin
						out = 4'b1011;
					end
					else
					begin
						out = 4'b0011;
					end
				S7:
					if (in)
					begin
						out = 4'b1101;
					end
					else
					begin
						out = 4'b1001;
					end
				S8:
					if (in)
					begin
						out = 4'b1100;
					end
					else
					begin
						out = 4'b1110;
					end
			endcase
			end

endmodule
