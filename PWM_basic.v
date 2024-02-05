`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/18/2023 01:23:50 PM
// Design Name: 
// Module Name: PWM_basic
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


module PWM_basic #(parameter n = 8)(
    input clk,
    input reset,
    input [n-1 :0 ] duty,
    output pwm_out
    );
    
    reg [n-1:0] Q_reg,Q_next;
    
    // up counter
    always @(posedge clk , negedge reset)
    begin
            
            if(!reset )
            Q_reg  <= 'b0;
            else
            Q_reg <= Q_next;
    end
    
    // next state logic
    always@(*)
    begin
    
        Q_next = Q_reg + 1;
    
    end
    
    //output 
    assign pwm_out = (Q_reg < duty);
    
endmodule
