module decoder (tenbit,f,s,t);

input [9:0] tenbit;
reg [9:0] number;
output reg [3:0] f,s,t;


always @ ( * )
begin

number = tenbit;
f = 0;
s = 0;
t = 0;

if (number >= 100)
	begin
	
	t = (number / 100);
	number  = (number % 100);

	end
if (number >= 10)
	begin
	
	s = (number / 10);
	number = (number % 10);

	end

f = number;

end 

endmodule 