library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RAM is
    port (CLK : in std_logic;
          WE  : in std_logic;
          A   : in std_logic_vector(255 downto 0);
          DI  : in integer range 1 to 256 * 256;
          DO  : out integer range 1 to 256 * 256
          );
end RAM;

architecture syn of RAM is
    type ram_type is array ( 255 downto 0) of integer range 1 to 256 * 256;
    signal RAM : ram_type;
begin
    process (CLK)
    begin
        if (CLK'event and CLK = '1') then
            if (WE = '1') then
                RAM(to_integer(unsigned(A))) <= DI;
            end if;
        end if;
    end process;

    DO <= RAM(to_integer(unsigned(A)));

end syn;
