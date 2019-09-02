module FIFO4_8(
wData,
//write, //1 write 0 read
wEnable,
rEnable,
//wPtr,
//rPtr,
clk,
reset,
rData,
full,
empty
);

input [3:0] wData;
//input write;
input wEnable;
input rEnable;
//input [7:0] wPtr;
//input [7:0] rPtr;
input clk;
input reset;
output [3:0] rData;
output full;
output empty;

wire read;
wire full;
wire empty;
wire [8:0] wPtr;
wire [8:0] rPtr;
//assign read = ~write;

// TODO
writePtr writePtr_1 (
.clk(clk),
.reset(reset),
.wEnable(wEnable),
.full(full),
.wPtr(wPtr)
);

readPtr readPtr_1 (
.clk(clk),
.reset(reset),
.rEnable(rEnable),
.empty(empty),
.rPtr(rPtr)
);

memory_array(
.clk(clk),
.wEnable(wEnable),
.wPtr(wPtr),
.rPtr(rPtr),
.data_in(wData),
.data_out(rData),
.full(full),
.empty(empty)
);


endmodule


