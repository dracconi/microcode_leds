`timescale 1ns/1ns

module counter
  #(parameter WIDTH = 10)
   (input           clk,
    input           en,
    input [WIDTH:1] threshold,
    input           reset,
    output reg      finished);

   reg [WIDTH:1] ctr;

   always @(posedge clk)
     if (en) begin
        if (reset)
          {ctr, finished} <= {{WIDTH{1'b0}}, 1'b0};
        else if (ctr >= threshold)
          finished <= 1'b1;
        else
          ctr <= ctr + 1;
     end
   
endmodule
