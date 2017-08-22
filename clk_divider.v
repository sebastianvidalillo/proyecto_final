`timescale 1ns / 1ps

module clock_divider(
    input clk,
    input rst,
    output reg clk_div
    );
    
   parameter constantNumber = 2;
   
   reg [63:0] count;
    
   always @ (posedge(clk) or posedge(rst))
   begin
       if (rst == 1'b1)
           count <= 32'd0;
       else if (count == (constantNumber - 32'd1))
           count <= 32'd0;
       else
           count <= count + 32'b1;
   end
   
   always @ (posedge(clk) or posedge(rst))
   begin
       if (rst == 1'b1)
           clk_div <= 1'b0;
       else if (count == (constantNumber - 1))
           clk_div <= ~clk_div;
       else
           clk_div <= clk_div;
   end
  
endmodule
