`timescale 1ns / 1ps
`include "../DFF.v"

module DFF_tb;

  // Parameters
  localparam period = 10;
  // Ports
  reg  clk = 0;
  reg  rstn = 0;
  reg  D = 0;
  wire Q;

  DFF DFF_dut (
      .clk(clk),
      .rstn(rstn),
      .D(D),
      .Q(Q)
  );

  initial begin
    forever #(period / 2) clk <= ~clk;
  end

  initial begin
    $dumpfile("DFF_wave.vcd");
    $dumpvars;

    #5 rstn <= 1;
    #5 D <= 1;
    #16 D <= 0;
    #10 D <= 1;
    #5 D <= 0;
    #15 D <= 1;
    #40 D <= 0;
    #20;
    $finish;
  end

endmodule
