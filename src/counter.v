module counter
  #(parameter WIDTH = 9)
   (input           clk,
    input           en,
    input [WIDTH:1] threshold,
    input           reset,
    output reg      finished);

   reg [WIDTH:1] ctr;

   always @(posedge clk)
     if (reset) begin
       {ctr, finished} <= {{WIDTH{1'b0}}, 1'b0};
     end else if (en) begin
        if (ctr >= threshold)
          finished <= 1'b1;
        else
          ctr <= ctr + 1;
     end
   
endmodule

