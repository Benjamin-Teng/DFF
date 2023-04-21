module DFF (
    input      clk,
    input      rstn,
    input      D,
    output reg Q
);

  always @(posedge clk or negedge rstn) begin
    if (~rstn) begin
      Q <= 0;
    end else begin
      Q <= D;
    end
  end

endmodule
