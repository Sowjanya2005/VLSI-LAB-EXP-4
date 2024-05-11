EXP 4:                          SIMULATION AND IMPLEMENTATION OF SEQUENTIAL LOGIC CIRCUITS

DATE:

AIM: 

 To simulate and synthesis SR, JK, T, D - FLIPFLOP, COUNTER DESIGN using Xilinx ISE.

APPARATUS REQUIRED:

Xilinx 14.7
Spartan6 FPGA

PROCEDURE:

STEP:1  Start  the Xilinx navigator, Select and Name the New project.

STEP:2  Select the device family, device, package and speed.       

STEP:3  Select new source in the New Project and select Verilog Module as the Source type.                       

STEP:4  Type the File Name and Click Next and then finish button. Type the code and save it.

STEP:5  Select the Behavioral Simulation in the Source Window and click the check syntax.                       

STEP:6  Click the simulation to simulate the program and  give the inputs and verify the outputs as per the truth table.               

STEP:7  Select the Implementation in the Sources Window and select the required file in the Processes Window.

STEP:8  Select Check Syntax from the Synthesize  XST Process. Double Click in the  FloorplanArea/IO/Logic-Post Synthesis process in the User Constraints process group. UCF(User constraint File) is obtained. 

STEP:9  In the Design Object List Window, enter the pin location for each pin in the Loc column Select save from the File menu.

STEP:10 Double click on the Implement Design and double click on the Generate Programming File to create a bitstream of the design.(.v) file is converted into .bit file here.

STEP:11  On the board, by giving required input, the LEDs starts to glow light, indicating the output.


SR FLIPFLOP

LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/6987778/77fb7f38-5649-4778-a987-8468df9ea3c3)

VERILOG CODE:
```
module srff(clk,rst,s,r,q);
input clk,rst,s,r;
output reg q;
always @(posedge clk)
begin
if(rst)
 q<=1'b0;
else
 begin
 case({s,r})
 2'b00:q<=q;
 2'b01:q<=1'b0;
 2'b10:q<=1'b1;
 2'b11:q<=1'bx;
 default:q<=1'bx;
 endcase
 end
end 
endmodule
```
OUTPUT:

![srff](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/6d4bfb6f-2fb4-43f4-a768-ce065b5515c4) 


JK FLIPFLOP

LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/6987778/1510e030-4ddc-42b1-88ce-d00f6f0dc7e6)

VERILOG CODE:
```
module jkff(clk,rst,j,k,q);
input clk,rst,j,k;
output reg q;
always @(posedge clk)
begin
if(rst)
 q<=1'b0;
else
 begin
 case({j,k})
 2'b00:q<=q;
 2'b01:q<=1'b0;
 2'b10:q<=1'b1;
 2'b11:q<=~q;
 default:q<=1'bx;
 endcase
 end
end 
endmodule
```
OUTPUT:

![jkff](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/52670a8f-e6c6-49fc-ae52-a939d288c39c)

T FLIPFLOP

LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/6987778/7a020379-efb1-4104-85ee-439d660baa08)

VERILOG CODE:
```
module tff(clk,rst,t,q);
input clk,rst,t;
output reg q;
always @(posedge clk)
 begin
 if(rst)
 q<=0;
 else if(t)
 q<=~q;
 else
 q<=q;
 end
endmodule
```
OUTPUT:

![tff](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/d5f59ae8-6140-4f6f-a069-e1589233b253)

D FLIPFLOP

LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/6987778/dda843c5-f0a0-4b51-93a2-eaa4b7fa8aa0)

VERILOG CODE:
```
module dff(d,clk,rst,q);
input d,clk,rst;
output reg q;
always @(posedge clk)
begin 
if(rst)
 q <=1'b0;
else
 q <= d;
end
endmodule
```
OUTPUT:

![dff](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/032eae68-8acb-47a4-8986-e94a07b8641c)

COUNTER

MOD 10 COUNTER

LOGIC DIAGRAM:

![image](https://github.com/Sowjanya2005/VLSI-LAB-EXP-4/assets/159280328/6d8c423a-253d-4fd7-8d70-e3e194ab7bb0)

VERILOG CODE:
```
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
```
OUTPUT:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/91ef423f-ae13-49f1-910a-5a2d60e3d2ec)

UP COUNTER

LOGIC DIAGRAM:

![image](https://github.com/Sowjanya2005/VLSI-LAB-EXP-4/assets/159280328/6479ecaf-07fe-40a7-a792-68b83097ef72)

VERILOG CODE:
```
module upcounter(clk,rst,count);
input clk,rst;
output[3:0]count;
reg[3:0]count;
always@(posedge clk)
begin
if(rst)
count<=4'b0;
else
count<=count+1;
end
endmodule
```

OUTPUT:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/f9363738-5db6-4705-973e-9b5a9eace10f)

DOWN COUNTER

LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/72754376-10c4-4f0b-90c8-c102e987c2e9)

VERILOG CODE:
```
module downcounter(clk,rst,count);
input clk,rst;
output[3:0]count;
reg[3:0]count;
always@(posedge clk)
begin
if(rst)
count<=4'b0;
else
count <=count-1;
end
endmodule
```
OUTPUT:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/8aee131e-8d6d-466c-aba3-e03fa0bbe4c5)

RING COUNTER

LOGIC DIAGRAM:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/7bc26c76-258a-415e-8a3b-e4d95e105569)

VERILOG CODE:
```
module jkff(j,k,clock,reset,q,qb);
input j,k,clock,reset;
output reg q,qb;
always@(negedge clock)
begin
case({reset,j,k})
3'b100 :q=q;
3'b101 :q=0;
3'b110 :q=1;
3'b111 :q=~q;
default :q=0;
endcase
qb<=~q;
end
endmodule
module ripple_count(j,k,clock,reset,q,qb);
input j,k,clock,reset;
output wire [3:0]q,qb;
jkff JK1(j,k,clock,reset,q[0],qb[0]);
jkff JK2(j,k,q[0],reset,q[1],qb[1]);
jkff JK3(j,k,q[1],reset,q[2],qb[2]);
jkff JK4(j,k,q[2],reset,q[3],qb[3]);
endmodule
```
OUTPUT:

![image](https://github.com/navaneethans/VLSI-LAB-EXP-4/assets/159280328/ac16c25d-cba2-49b5-b97c-4629d234673a)

RESULT:
 
   Hence, the simulation and synthesis of SR, JK, T, D FLIPFLOP, COUNTER DESIGN is verified using Xilinx ISE.

