// Here's a solution to this week's challenge.
// Maybe we shouldn't include this at the start of the week?
module challenge(input clk, input reset, input enable, output [3:0] count);
reg count;
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
