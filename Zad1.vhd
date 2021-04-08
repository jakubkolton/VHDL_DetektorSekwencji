library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity Zad1 is
	port (clk 		 : in std_logic;
		   wej 		 : in std_logic; -- dana wejœciowa
			sekwencja : inout std_logic_vector (5 downto 0) := "000000"; -- poprawna sekwencja
	  	   det 		 : out std_logic); -- dana wejœciowa - czy wykryto sekwencjê?
end Zad1;

architecture Behavioral of Zad1 is
	
-- Rejestr szeregowo - równoleg³y ----------------------------------------------------
procedure reg
	(signal Q, Zegar : in std_logic;
	 signal Y        : inout std_logic_vector (5 downto 0)) is
begin
	if (Zegar'event and Zegar = '1') then
			for i in 5 downto 1 loop
				Y(i) <= Y(i-1);
			end loop;
			Y(0) <= Q;
		end if;
end reg;
--------------------------------------------------------------------------------------

-- Komparator ------------------------------------------------------------------------
procedure comp
	(signal num1 : in std_logic_vector (5 downto 0); -- liczba wejœciowa
	 signal eq   : out std_logic) is -- czy równe
	 constant num2 : std_logic_vector (5 downto 0) := "100101";
begin
	if (num1 = num2) then
		eq <= '1';
	else
		eq <= '0';
	end if;
end comp;
--------------------------------------------------------------------------------------

-- Uk³ad -----------------------------------------------------------------------------
begin
	process (clk)
	begin
		reg (wej, clk, sekwencja);
	end process;
	comp (sekwencja, det);	
end Behavioral;
--------------------------------------------------------------------------------------
