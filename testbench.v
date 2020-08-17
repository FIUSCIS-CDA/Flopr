
module testbench();

reg clk, reset, D;
wire Q;

localparam CLK_PERIOD=20;

always @*
begin
   clk <= 1;  # (CLK_PERIOD/2);
   clk <= 0;  # (CLK_PERIOD/2);
end

Flopr myRegister(reset, clk, D, Q);

initial begin
reset=1;  #(CLK_PERIOD/2);
reset=0;D=1; #(CLK_PERIOD/4);
if (Q !== 0) begin
   $display("Error: Register changed on falling edge"); $stop;
end
#(CLK_PERIOD/2);
if (Q !== D) begin
   $display("Error: Register did not change on rising edge"); $stop;
end
$display("All tests passed.");
end

endmodule