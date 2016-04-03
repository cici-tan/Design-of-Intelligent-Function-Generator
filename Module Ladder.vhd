Module Ladder:
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
entity ladder is
	port(clk,reset:in std_logic;
		q:out std_logic_vector(7 down to 0));
end ladder;
architecture ladder_arc of ladder is
begin
	process(clk,reset)
	variable tmp:std_logic_vector(7 down to 0); 
	variable a:std_logic;
	begin
		if reset='0' then 
			tmp:="00000000";
		elsif clk'event and clk='1' then 
			if a='0' then
				if tmp="11111111" then 
					tmp:="00000000"; 
					a:='1';
				else 
					tmp:=tmp+16;
					a:='1'; 
				end if;
			else
				a:='0';
			end if; 
		end if;
		q<=tmp; 
	end process;
end ladder_arc;