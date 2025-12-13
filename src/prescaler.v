module prescaler
  #(parameter WIDTH = 10)
   (input  clk,
    input  reset,
    output reg cout);

   reg [WIDTH:1] ctr = 0;

   always @(posedge clk)
     if (!reset)
       {cout, ctr} <= ctr + 1;
     else
       {cout, ctr} <= {1'b0, {WIDTH{1'b0}}};

endmodule

