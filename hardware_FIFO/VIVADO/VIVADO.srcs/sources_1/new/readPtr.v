
module readPtr(
clk,
reset,
rEnable,
empty,
rPtr
);

input clk;
input reset;
input rEnable;
input empty;
output reg [8:0] rPtr;

initial 
  rPtr = 9'd0;

always @ (posedge clk) begin
  if(~rEnable || empty)
    rPtr <= rPtr;
  else if(reset)
    rPtr <= 9'd0;
  else
    rPtr <= rPtr + 9'd1;
  end

endmodule