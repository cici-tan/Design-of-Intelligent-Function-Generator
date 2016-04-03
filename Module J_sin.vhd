Module J_sin:
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; 
entity j_sin is
	port(clk,reset:in std_logic;
		d:out integer range 0 to 255);
end j_sin;
architecture sin_arc of j_sin is 
begin
	process(clk,reset)
	variable tmp:integer range 0 to 63; 
	begin
		if reset='0' then 
			d<=0;
		elsif clk'event and clk='1' then 
			if tmp=63 then
				tmp:=0; 
			else
				tmp:=tmp+1;
			end if; 
			case tmp is
				when 00=>d<=255; when 01=>d<=254; when 03=>d<=249; 
				when 04=>d<=245; when 06=>d<=233; when 07=>d<=225; 
				when 09=>d<=207; when 10=>d<=197; when 12=>d<=174; 
				when 13=>d<=162; when 15=>d<=137; when 16=>d<=124;
				when 02=>d<=252; when 05=>d<=239; when 08=>d<=217; 
				when 11=>d<=186; when 14=>d<=150; when 17=>d<=112;
				when 20=>d<=75; when 23=>d<=43; when 26=>d<=19;
				when 29=>d<=4; when 32=>d<=0; when 35=>d<=8;
				when 38=>d<=26; when 41=>d<=53; when 44=>d<=87;
				when 47=>d<=124; when 50=>d<=162; when 53=>d<=197; 
				when 56=>d<=225; when 59=>d<=245; when 62=>d<=254;
				when 18=>d<=99; when 21=>d<=64; when 24=>d<=34; 
				when 27=>d<=13; when 30=>d<=1; when 33=>d<=1; 
				when 36=>d<=13; when 39=>d<=34; when 42=>d<=64; 
				when 45=>d<=99; when 48=>d<=137; when 51=>d<=174; 
				when 54=>d<=207; when 57=>d<=233; when 60=>d<=249; 
				when 63=>d<=255; 
				when others=>null;
			end case; 
		end if;
	end process; 
end sin_arc;
