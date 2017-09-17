----------------------------------------------------------------------------------
-- Company: none
-- Engineer: John Voltz
-- 
-- Create Date:    13:53:28 09/17/2017 
-- Design Name: 8-bit Emulator Bridge
-- Module Name:    emu-bridge - Behavioral 
-- Project Name: 
-- Target Devices: XC6SLX25-3FTG256
-- Tool versions: 
-- Description: A bridge between Amiga Zorro bus and FPGA emulated 8-bit systems
-- providing connection to keyboard, mouse, joysticks, network, and graphics of host.
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity emu_bridge is
    Port ( 
           CLK50 : in STD_LOGIC;		
           zA : in  STD_LOGIC_VECTOR (23 downto 1);
           zAD : inout  STD_LOGIC_VECTOR (15 downto 0);
			  
           znSLAVEN : out  STD_LOGIC;
           znCFGOUT : out  STD_LOGIC;
           znCINH : out  STD_LOGIC;
           zXRDY : out  STD_LOGIC;
           znDTACK : out  STD_LOGIC;
			  
           znCFGIN : in  STD_LOGIC;         
           znCCS : in  STD_LOGIC;
           zSENSEZ3 : in  STD_LOGIC;
           zE7M : in  STD_LOGIC;
           zDOE : in  STD_LOGIC;
           znFCS : in  STD_LOGIC;
           znBERR : in  STD_LOGIC;
           znRESET : in  STD_LOGIC;
           zREAD : in  STD_LOGIC;
			  zFC : in  STD_LOGIC_VECTOR (2 downto 0);
           znDS0 : in  STD_LOGIC;
			  znDS1 : in  STD_LOGIC;
           znDS2 : in  STD_LOGIC;
			  znDS3 : in  STD_LOGIC;
			  
           -- 3.3V - 5V level translator directional control
			  -- 1 and 2 are data bus, 3 and 4 are address bus
			  -- low on BUS_DIRx is input to board, high is output
           BUS_DIR1 : out  STD_LOGIC;
           BUS_DIR2 : out  STD_LOGIC;
           BUS_DIR3 : out  STD_LOGIC;
           BUS_DIR4 : out  STD_LOGIC
			);
end emu_bridge;

architecture Behavioral of emu_bridge is

signal addr_latch : STD_LOGIC_VECTOR(31 downto 1);
signal configured : STD_LOGIC;
signal base_addr : STD_LOGIC_VECTOR(31 downto 1);

type zorro_state_labels is ( 
	zADDR_PHASE,
	zDATA_PHASE
	
);

signal zorro_state : zorro_state_labels;

begin

-- Board reset
p_Reset : process (znRESET)
begin
if (znRESET = '0') then 
	configured <= '0';
	base_addr <= X"00E80000";
	BUS_DIR1 <= '0';
	BUS_DIR2 <= '0';
	BUS_DIR3 <= '0';
	BUS_DIR4 <= '0';
end if;

end process;

-- AutoCONFIG logic
p_AutoCONFIG : process (znCFGIN)
begin

if (znCFGIN = '0' and znRESET = '1') then
		
		
end if;

end process;



end Behavioral;

