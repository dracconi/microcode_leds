`timescale 1ns / 1ns

module top
   (input         clk,
    output [12:1] vec,
    output [2:1]  pwm);

   wire [4:1] pwm_tab [1:2];

   sequencer seq(.clk(clk), .vec(vec), .pwm(pwm_tab));
   pwm pwm_gen(.clk(clk), .pwm_in(pwm_tab), .pwm(pwm));
   
endmodule
