module mod10counter(clk,rst,count);
input clk,rst;
output[3:0]count;
reg[3:0]count;
always@(posedge clk)
begin
if(rst|count==4'b1001)
count<=4'b0;
else
count<=count+1;
end
endmodule
