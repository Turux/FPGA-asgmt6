module display_driver (digit,segment);

input [3:0] digit;
output reg [6:0] segment;

always @ ( * )
begin
	case (digit)
		4'd0 : begin
			segment = 7'b1000000;
			end
		4'd1 : begin
			segment = 7'b1111001;
			end
		4'd2 : begin
			segment = 7'b0100100;
			end
		4'd3 : begin
			segment = 7'b0110000;
			end
		4'd4 : begin
			segment = 7'b0011001;
			end
		4'd5 : begin
			segment = 7'b0010010;
			end
		4'd6 : begin
			segment = 7'b0000010;
			end
		4'd7 : begin
			segment = 7'b1111000;
			end
		4'd8 : begin
			segment = 7'b0000000;
			end
		4'd9 : begin
			segment = 7'b0011000;
			end
		default: segment = 7'b00001110;
	endcase	
		
end

endmodule 