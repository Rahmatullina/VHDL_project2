library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
--use ieee.numeric_std.all;

entity hist is
    generic(N : integer := 2);
    port(
    rst, clk : in std_logic;
    -- mark each input pixel
    inp_tvalid : in std_logic;
    -- mark the last pixel of every string
    inp_tlast : in std_logic;
    -- mark the first pixel of every frame
    inp_tuser : in std_logic_vector(0 downto 0);
    -- input data
    inp_tdata : in std_logic_vector(7 downto 0);
    -- mark output data
    outp_tvalid : out std_logic;
    -- output data : histogram
    outp_tdata : out std_logic_vector(15 downto 0)
    );
end hist;

architecture Behavioral of hist is
component RAM is
port (CLK : in std_logic;
          WE  : in std_logic;
          A   : in std_logic_vector(255 downto 0);
          DI  : in integer range 1 to 256 * 256;
          DO  : out integer range 1 to 256 * 256
          );
end component;
signal out1 : integer range 1 to 256*256;
ram1 : RAM port map (clk, 0, conv_integer(inp_tdata), out1, conv_integer(1));
signal out2 : integer range 1 to 256*256;
ram2 : RAM port map(clk, inp_tvalid, conv_integer(inp_tdata), out1 + 1, out2 );
begin     
    process(clk) is begin
    end process;
end Behavioral;
