`timescale 1ns / 1ps

module traffic_light( input clk, input rst, output reg [2:0] lightWE, output reg [2:0] lightNS );
 reg [5:0] state;
parameter   S0 = 6'b000001,
            S1 = 6'b000010,
            S2 = 6'b000100,
            S3 = 6'b001000,
            S4 = 6'b010000,
            S5 = 6'b100000;

reg [3:0] count;
parameter  SEC15 = 4'd13, SEC3 = 4'd2;
 
always @(posedge clk or posedge rst) 
    if (rst == 1) begin
        state <= S0;
        count <= 0;
   	 end 
		else
        case (state)
           S0: if (count < SEC15) begin
               state <=S0;
               count <= count +1;
               
           end 
		else 
			begin
                state <= S1;
                count <= 0;
                end
          S1: if (count < SEC3) begin
               state <=S1;
               count <= count +1;
               
           end 
	else
		begin
                state <= S2;
                count <= 0;
                end

        S2: if (count < SEC3) begin
               state <=S2;
               count <= count +1;
               
           end 
		else 
			begin
                state <= S3;
                count <= 0;
                end
        S3: if (count < SEC15) begin
               state <=S3;
               count <= count +1;
               
           end 
		else 
			begin
                state <= S4;
                count <= 0;
                end
        S4: if (count < SEC3) begin
               state <=S4;
               count <= count +1;
               
           end 
		else 
			begin
                state <= S5;
                count <= 0;
                end

        S5: if (count < SEC3) begin
               state <=S5;
               count <= count +1;
               
           end 
		else 
			begin
                state <= S0;
                count <= 0;
                end
            default state <= S0;
        endcase

    always @(*)
   	begin
		case (state)
       	S0: begin lightWE <= 3'b001; lightNS <=3'b100; end
       	S1: begin lightWE <= 6'b010; lightNS <=3'b100; end
       	S2: begin lightWE <= 6'b100; lightNS <=3'b100; end
       	S3: begin lightWE <= 6'b100; lightNS <=3'b001; end
       	S4: begin lightWE <= 6'b100; lightNS <=3'b010; end
       	S5: begin lightWE <= 6'b100; lightNS <=3'b100; end
       default begin lightWE <= 6'b100; lightNS <=3'b100; end
	
	endcase
end
endmodule
