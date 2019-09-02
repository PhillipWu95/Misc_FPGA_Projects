
module writePtr(
clk,
reset,
wEnable,
full,
wPtr
);

input clk;
input reset;
input wEnable;
input full;
output reg [8:0] wPtr;


always @ (posedge clk) begin
  if(~wEnable || full) 
    wPtr <= wPtr;
  else if(reset)
    wPtr <= 9'd0;
  else
    wPtr <= wPtr + 9'd0;
  end

endmodule
