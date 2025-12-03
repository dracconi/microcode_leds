`timescale 1ns / 1ns

module top_tb();
   reg clk = 1'b0;

   wire [1:0] pwm;
   wire [11:0] vec;
   
      
   top dut(.clk(clk), .pwm(pwm), .vec(vec));

   always
     #5 clk = ~clk;

   initial begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #10000000 $finish();
   end
      
endmodule
