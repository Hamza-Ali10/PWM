`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/18/2023 01:43:45 PM
// Design Name: 
// Module Name: PMW_basic_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PWM_basic_TB(

    );
    parameter n=8;
    reg clk,reset;
    reg [n-1:0] duty;
    wire pwm_out;
    
    
    PWM_basic #(.n(n)) uut
    (
    .clk(clk),
    .reset(reset),
    .duty(duty),
    .pwm_out(pwm_out)
    );
    
    //Timer
    initial #(7 * 2**n * T  ) $stop;
    
      localparam T = 10;
    always
    begin
          clk = 1'b0;
         #(T / 2);
          clk = 1'b1;
         #(T / 2);
    end
    initial
    begin
          reset = 1'b0;
          #2
          reset = 1'b1;
          duty = 0.25*(2**n);
            
         repeat(2* 2**n)@(negedge clk);
         duty = 0.5*(2**n);
         
         repeat(2* 2**n)@(negedge clk);
         duty = 0.75*(2**n);
         
         
         
         
    end
endmodule
