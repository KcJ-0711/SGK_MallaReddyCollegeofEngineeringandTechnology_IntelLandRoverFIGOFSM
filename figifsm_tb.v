module figofsm_tb;

reg clk, reset;
reg [4:0] ins;
reg in;
wire [3:0] out;

integer i;

figofsm ff (.clk(clk), .in(in), .reset(reset), .out(out));

initial begin

clk = 1'b0;
forever #10 clk = ~clk;

end

initial begin

reset = 1'b1;
#1;
reset = 1'b0;
end

initial begin

ins = 5'b10101;

$monitor ("time=%d, in=%b, out=%b", $time, in, out);

for(i = 4; i > 0; i = i - 1) begin

in = ins[i];
#5;

end

end

endmodule
