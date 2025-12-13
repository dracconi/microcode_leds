`timescale 1ns/1ns

module sequencer
  (input         clk,
   output [12:1] vec,
   output [4:1]  pwm [1:2]);

   parameter OP_WAIT = 1'b0;
   parameter OP_JUMP = 1'b1;
   
   reg fetch = 1'b1;
   
   wire opcode;
   wire [9:1] addr_or_cycles;
   wire [9:1] daddr;
   wire [2:1] UNUSED;
   wire [32:1] dout;
   wire [9:1]  next_addr = (opcode == OP_JUMP ? addr_or_cycles : (daddr + 1));
   rom ucode(.clk(clk), .en(fetch), .addr(next_addr), .daddr(daddr), .dout(dout));
   assign {pwm[2], pwm[1], vec, UNUSED, opcode, addr_or_cycles} = dout;

   wire cout;
   prescaler prs(.clk(clk), .cout(cout), .reset(fetch));
   wire finished;
   counter ctr(.clk(clk), .en(cout), .threshold(addr_or_cycles), .reset(fetch), .finished(finished));

   always @(negedge clk) begin
     case (opcode)
       OP_WAIT : begin
          if (finished)
            fetch <= 1'b1;
          else if (fetch)
            fetch <= 1'b0;
       end
       OP_JUMP : begin
          fetch = ~fetch;
       end
     endcase
   end

   
endmodule
