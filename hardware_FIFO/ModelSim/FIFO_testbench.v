
module FIFO_tb;

reg [3:0] wData;
reg wEnable, rEnable;
reg clk;
reg reset;
wire [3:0] rData;
wire full, empty;


FIFO4_8 FIFO_1(
.wData(wData),
.wEnable(wEnable),
.rEnable(rEnable),
.clk(clk),
.reset(reset),
.rData(rData),
.full(full),
.empty(empty)
);

initial begin
  clk = 0;
  reset = 0;
  wEnable = 1;
  rEnable = 0;
  wData = 4'b0;
end //initial

initial begin
  #3000 wEnable <= 0;
  #3000 rEnable <= 1;
end 

always 
  #5 clk <= ! clk;

always
  #10 wData <= wData + 4'd1;
  

endmodule