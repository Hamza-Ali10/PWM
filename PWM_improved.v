`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamza Ali
// 
// Create Date: 08/18/2023 02:47:25 PM
// Design Name: 
// Module Name: PWM_improved
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


module PWM_improved #(parameter R = 8 , timer_bits = 15)(
    input clk,
    input reset,
    input [R :0 ] duty,
    input [timer_bits-1 :0 ]final_value,
    output pwm_out
    );
    
    reg [R-1:0] Q_reg,Q_next;
    reg q_reg , q_next;
    wire tick;
    // up counter
    always @(posedge clk , negedge reset)
    begin
            
            if(!reset )
            begin
              Q_reg  <= 'b0;
              q_reg  <= 'b0;
            end
            else if(tick)
            begin
              Q_reg <= Q_next;
              q_reg <= q_next;
            end
           else
           begin
              Q_reg <= Q_reg;
              q_reg <= q_reg;
            end  
    end
    
    // next state logic
    always@(*)
    begin
    
        Q_next = Q_reg + 1;
        q_next = (Q_reg < duty);
    end
    
    //output 
    assign pwm_out = q_reg;
    
    Timer_input #(.n(timer_bits))(
    .clk(clk),
    .reset(reset),
    .enable(1'b1),
    .final_value(final_value),
    .done()
    );
    
endmodule

