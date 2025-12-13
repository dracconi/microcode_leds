module pwm
  #(parameter PWM_WIDTH = 4)
   (input        clk,
    input [PWM_WIDTH:1]  pwm_in [1:2],
    output [2:1] pwm);

   wire en;

   reg [PWM_WIDTH:1] cnt;
   
   prescaler #(.WIDTH(2)) div(.clk(clk), .reset(1'b0), .cout(en));

   always @(posedge clk) begin
      if (en)
        cnt <= cnt + 1;
   end

   wire [PWM_WIDTH:1] cnt_180 = cnt + {(PWM_WIDTH-1){1'b1}};

   assign pwm[1] = pwm_in[1] > cnt;
   assign pwm[2] = pwm_in[2] > cnt_180;
endmodule

