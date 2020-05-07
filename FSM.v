module FSM(clk, temperature, led, display1, display2, display3);

input clk;
input [9:0] temperature;
output reg [3:0] led;
output [6:0] display1, display2, display3;

reg [2:0] state, next_state;
reg [9:0] temp1, temp2, temp3, temp4;
reg [9:0] tempvalue;

initial state = IDLE;
initial tempvalue = 0;

localparam 	IDLE = 3'd0,
			READ1 = 3'd1,
			READ2 = 3'd2,
			READ3 = 3'd3,
			READ4 = 3'd4,
			COMPUTE = 3'd5,
			STATE_6 = 3'd6,
			STATE_7 = 3'd7;

wire [3:0] f,s,t;

decoder(tempvalue,f,s,t);
display_driver(f,display1);
display_driver(s,display2);
display_driver(t,display3);



always @ ( posedge clk)
begin

state = next_state;

end

always @ ( * )
begin

tempvalue = temperature;

	case ( state )
		IDLE : begin
			led = 4'b0000;
			next_state = READ1 ;
			end
		READ1 : begin
			led = 4'b0001;
			temp1 = tempvalue;
			next_state = READ2 ;
			end
		READ2 : begin
			led = 4'b0010;
			temp2 = tempvalue;
			next_state = READ3 ;
			end
		READ3 : begin
			led = 4'b0100;
			temp3 = tempvalue;
			next_state = READ4 ;
			end
		READ4 : begin
			led = 4'b1000;
			temp4 = tempvalue;
			next_state = COMPUTE ;
			end
		COMPUTE : begin
			led = 4'b1111;
			tempvalue = (temp1 + temp2 + temp3 + temp4)/4;
			next_state = IDLE ;
			end
		STATE_6 : begin
			led = 4'b1001;
			next_state = IDLE ;
			end
		STATE_7 : begin
			led = 4'b1001;
			next_state = IDLE ;
			end
		
	endcase
end

endmodule 