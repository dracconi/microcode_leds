`timescale 1ns / 1ns

module top
  #(parameter COUNTER_BITS = 4)
   (input         clk,
    output [12:1] vec,
    output [2:1]  pwm);

   wire [COUNTER_BITS:1] pwm_tab [1:2];

   sequencer seq(.clk(clk), .vec(vec), .pwm(pwm_tab));

   reg [COUNTER_BITS:1] counter;
   assign pwm[1] = pwm_tab[1] > counter;
   // move by 180deg to maybe make less sudden current spikes
   assign pwm[2] = pwm_tab[2] > (counter + {(COUNTER_BITS-1){1'b1}});

   always @(posedge clk) begin
      counter <= counter + 1;
   end
endmodule
