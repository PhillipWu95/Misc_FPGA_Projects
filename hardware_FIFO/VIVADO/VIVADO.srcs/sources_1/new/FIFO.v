module FIFO4_8(
wData,
//write, //1 write 0 read
wEnable_in,
rEnable_in,
//wPtr,
//rPtr,
clk,
reset,
rData_out,
full,
empty
);

input [3:0] wData;
//input write;
input wEnable_in;
input rEnable_in;
//input [7:0] wPtr;
//input [7:0] rPtr;
input clk;
input reset;
output [3:0] rData_out;
output full;
output empty;

wire read;
wire full;
wire empty;
wire [3:0] rData;
wire [8:0] wPtr;
wire [8:0] rPtr;
//assign read = ~write;
reg wEnable, rEnable;
reg rEnable_in_not;
reg wEnable_in_not;
reg [3:0] rData_out_reg;

initial begin
    wEnable = 0;
    rEnable = 0;
    rData_out_reg = 4'd0;
end

assign rData_out = rData_out_reg;
//assign rData_out = rData;

//always @ (posedge clk) begin
//    if(reset) begin
//        rData_out_reg <= 4'd0;
//        wEnable <= 0;
//        rEnable <= 0;
//    end
//end

always @ (posedge clk) begin
    wEnable_in_not <= ~wEnable_in;
    rEnable_in_not <= ~rEnable_in;
end

always @ (posedge clk) begin
    wEnable <= (wEnable_in_not & wEnable_in);
    rEnable <= (rEnable_in_not & rEnable_in);
end

always @ (posedge clk) begin
    if(rEnable)
        rData_out_reg <= rData;
end



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

memory_array memory_array_1(
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


