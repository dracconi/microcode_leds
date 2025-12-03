`timescale 1ns/1ns

module rom
  #(parameter FILE = "memory.hex",
    parameter WIDTH = 32,
    parameter DEPTH = 9)
  (input                clk,
   input                en,
   input [DEPTH:1]      addr,
   output reg [DEPTH:1] daddr,
   output reg [WIDTH:1] dout);

   reg [WIDTH:1] mem [0:((1<<DEPTH)-1)];

   initial
     $readmemh(FILE, mem);
   
   always @(posedge clk) begin
      if (en) begin
         daddr <= addr;
         dout <= mem[addr];
      end
        
   end
   
endmodule
