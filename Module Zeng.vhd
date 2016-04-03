library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; entity zeng is
	port(clk,reset:in std_logic;
		q:out std_logic_vector(7 down to 0));
end zeng;
architecture zeng_arc of zeng is 
begin
	process(clk,reset)
	variable tmp:std_logic_vector(7 down to 0); 
	begin
		if reset='0' then 
			tmp:="00000000";
		elsif clk'event and clk='1' then 
			if tmp="11111111" then 
			tmp:="00000000";
		else tmp:=tmp+1;
		end if; 
	end if; 
	q<=tmp;
	end process; 
end zeng_arc;