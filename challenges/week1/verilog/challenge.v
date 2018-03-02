// Here's a solution to this week's challenge, for infra testing purposes.
// Don't read it if you want to solve things yourself :)
module challenge(input clk, input reset, input enable, output reg [3:0] count);
always @ (posedge clk)
begin
    if (reset == 1'b1)
    begin
        count <= 0;
    end
    else if (enable == 1'b1)
    begin
        count <= count + 1;
    end
end
endmodule
