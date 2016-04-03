Module T_square: 
library ieee;
use ieee.std_logic_1164.all; 
entity t_square is
	port(clk,reset:in std_logic;
		q:out integer range 0 to 255);
end t_square;
architecture sq_arc of t_square is 
signal a:bit;
begin
	process(clk,reset)
	variable cnt:integer; 
begin
	if reset='0' then 
		a<='0';
	elsif clk'event and clk='1'then 
		if cnt<63 then
			cnt:=cnt+1; 
		else
			cnt:=0;
			a<=not a; 
		end if;
	end if; 
end process;
process(clk,a) 
begin
	if clk'event and clk='1' then 
		if a='1' then
			q<=255; 
		else
			q<=0; 
		end if;
	end if;
end process; 
end sq_arc;