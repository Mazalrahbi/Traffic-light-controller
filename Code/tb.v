`timescale 1ns / 1ps
	module traffic_light_tb;
`define clk_period 1000000000
    reg clk;
    reg rst;
    wire [2:0] lightWE;
    wire [2:0] lightNS;

    traffic_light DUT(.clk(clk), .rst(rst), .lightWE(lightWE), .lightNS(lightNS));

    always #(`clk_period/2) clk =~clk;

    initial begin
     //$vcdpluson;
    // $monitorb ("%d clk = %b rst = %b lightA = %b LightB = %b", $time,  clk, rst, lightA, lightB);
    clk = 1;
    rst =0;
    #`clk_period;
    rst =1;
    #`clk_period;
    rst = 0;
    #(`clk_period*20000);
    $stop;
        end
		endmodule
