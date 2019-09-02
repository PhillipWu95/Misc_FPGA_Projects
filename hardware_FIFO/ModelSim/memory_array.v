
module memory_array(
clk,
//wr, //0 read 1 write
wEnable,
wPtr,
rPtr,
data_in,
data_out,
full,
empty
);

input clk;
//input wr;
input wEnable;
input [8:0] wPtr;
input [8:0] rPtr;
input [3:0] data_in;
output [3:0] data_out;
output full, empty;

reg [3:0] memory [256:0];

assign full = (wPtr ^ rPtr == 9'b011111111)? 1'b1 : 1'b0;
assign empty = (wPtr == rPtr)? 1'b1 : 1'b0;
assign data_out = memory[rPtr[7:0]];

always @ (posedge clk) 
begin
  if(wEnable) //if write
    memory[wPtr[7:0]] <= data_in;
 // else
  //  memory[wPtr[7:0]] <= memory[wPtr[7:0]];
  
end //end always



endmodule
