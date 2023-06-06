
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:55:50 05/19/2015 
-- Design Name: 
-- Module Name:    Complete - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Arith.ALL;
use IEEE.STD_LOGIC_Unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Complete is

Port (	Clock : in std_logic;
			Reset : in std_logic;
			Start : in std_logic;
			Data_in : in std_logic_vector(  15 downto 0); 
			Data_out : out std_logic_vector(15 downto 0));	

End Complete;

Architecture Behavioral of Complete is

SIGNAL LLL: std_logic_vector(1 downto 0);
SIGNAL LLH: std_logic_vector(1 downto 0);
SIGNAL LHL: std_logic_vector(1 downto 0);
SIGNAL LHH: std_logic_vector(1 downto 0);
SIGNAL HLL: std_logic_vector(1 downto 0);
SIGNAL HLH: std_logic_vector(1 downto 0);
SIGNAL  HHL: std_logic_vector(1 downto 0);
SIGNAL  HHH: std_logic_vector(1 downto 0);

Component Forward is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic; 
		  Data_in : in std_logic_Vector(15 downto 0); 
		  LLL: out std_logic_vector(1 downto 0);
		  LLH: out std_logic_vector(1 downto 0);
		  LHL: out std_logic_vector(1 downto 0);
		  LHH: out std_logic_vector(1 downto 0);
		  HLL: out std_logic_vector(1 downto 0);
		  HLH: out std_logic_vector(1 downto 0);
		  HHL: out std_logic_vector(1 downto 0);
		  HHH: OUT std_logic_vector(1 downto 0)); 

end component;

component Inverse  is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic; 
		  Data_out : out std_logic_Vector( 15 downto 0); 
		  LLL: in std_logic_vector(1 downto 0);
		  LLH:  in std_logic_vector(1 downto 0);
		  LHL: in std_logic_vector(1 downto 0);
		  LHH: in std_logic_vector(1 downto 0);
		  HLL: in std_logic_vector(1 downto 0);
		  HLH: in std_logic_vector(1 downto 0);
		  HHL: in std_logic_vector(1 downto 0);
		  HHH: in std_logic_vector(1 downto 0)); 

end component; 

begin


C1: Forward

Port map(	Clock=> Clock, Start=>Start, Reset=>Reset, Data_in=>Data_in, 
				LLL=>LLL, LLH=>LLH, LHL=>LHL, 
				LHH=>LHH, HLL=>HLL, HLH=>HLH, HHL=>HHL, HHH=>HHH); 

C2: Inverse 

Port map( 	Clock=>Clock, Start=>Start, Reset=>Reset,Data_out=>Data_out,
				LLL=>LLL, LLH=>LLH, LHL=>LHL, 
				LHH=>LHH, HLL=>HLL, HLH=>HLH, HHL=>HHL, HHH=>HHH); 

End Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:56 05/13/2015 
-- Design Name: 
-- Module Name:    Main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Forward is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic; 
		  Data_in : in std_logic_Vector( 15 downto 0); 
		  LLL: out std_logic_vector(1 downto 0);
		  LLH: out std_logic_vector(1 downto 0);
		  LHL: out std_logic_vector(1 downto 0);
		  LHH: out std_logic_vector(1 downto 0);
		  HLL: out std_logic_vector(1 downto 0);
		  HLH: out std_logic_vector(1 downto 0);
		  HHL: out std_logic_vector(1 downto 0);
		  HHH: OUT std_logic_vector(1 downto 0)); 
		  
End Forward;

Architecture Behavioral of Forward is

signal H, L : std_logic_vector(7 downto 0); 
signal HH,HL, LH,LL: std_logic_vector( 3 downto 0); 

component LWT is 

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic; 
		  Data : in std_logic_Vector( 15 downto 0); 
		  Pout : out std_logic_vector( 7 downto 0);
		  Uout : out std_logic_vector( 7 downto 0));

end component; 

component Two_DWT is

Port ( 	Clock : in std_logic; 
			Start : in std_logic;
			Reset : in std_logic; 
			H : in std_logic_vector(7 downto 0); 
			L : in std_logic_vector(7 downto 0); 
			HH : out std_logic_vector( 3 downto 0); 
			HL : out std_logic_vector( 3 downto 0); 
			LH : out std_logic_vector( 3 downto 0); 
			LL : out std_logic_vector( 3 downto 0)); 
			
end component; 


component Three_DWT is 

Port ( 	Clock : in std_logic; 
			Start : in std_logic;
			Reset : in std_logic; 
			HH : in std_logic_vector( 3 downto 0); 
			HL : in std_logic_vector( 3 downto 0); 
			LH : in std_logic_vector( 3 downto 0); 
			LL : in std_logic_vector( 3 downto 0); 
			  LLL: out std_logic_vector(1 downto 0);
			  LLH: out std_logic_vector(1 downto 0);
			  LHL: out std_logic_vector(1 downto 0);
			  LHH: out std_logic_vector(1 downto 0);
			  HLL: out std_logic_vector(1 downto 0);
			  HLH: out std_logic_vector(1 downto 0);
			  HHL: out std_logic_vector(1 downto 0);
			  HHH: OUT std_logic_vector(1 downto 0)); 				


end component;


 
begin

D1: LWT 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>Data_in , Pout=>H, Uout=>L); 

D2 : Two_DWT 

Port map( Clock=>Clock, Start=>Start, Reset=>Reset, H=>H, L=>L, HH=>HH, HL=>HL, LH=>LH, LL=>LL) ;

D3: Three_DWT 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, HH=>HH, HL=>HL, LH=>LH, LL=>LL, LLL=>LLL, LLH=>LLH, LHL=>LHL, LHH=>LHH, HLL=>HLL, HLH=>HLH, HHL=>HHL, HHH=>HHH); 






End Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:44 04/05/2015 
-- Design Name: 
-- Module Name:    Main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity LWT is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic; 
		  Data : in std_logic_Vector( 15 downto 0); 
		  Pout : out std_logic_vector( 7 downto 0);
		  Uout : out std_logic_vector( 7 downto 0));
		  
End LWT;

Architecture Behavioral of LWT is

signal Even, Odd : std_logic_Vector ( 7 downto 0); 
signal Cout  : std_logic_vector(7 downto 0);
	
Component Split is 

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : in std_logic_vector(15 downto 0);
		Even : out std_logic_vector(7 downto 0);
		Odd : out std_logic_vector(7 downto 0));

end Component;

Component Predict  is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(7 downto 0);	
		Odd	: in std_logic_vector(7 downto 0);
		Cout  : out std_logic_vector(7 downto 0);
		Pout  : out std_logic_vector(7 downto 0));

end Component;


component Update is 

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;
		  Cout : in std_logic_vector( 7 downto 0); 
		  Even : in std_logic_vector( 7 downto 0);
		  Uout : out std_logic_vector( 7 downto 0));

end component;

begin

M1:Split 

Port map( Clock =>Clock, Start=>Start, Reset=>Reset, Data=>Data, Even => Even, Odd=> Odd);


M2: predict

Port map(Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout,Cout=>Cout, Even=>Even, Odd=>Odd );

M3 : Update 

Port Map ( Clock=>Clock,Start=>Start,Reset=>Reset,Cout=>Cout, Even=> Even, Uout=>Uout); 

End Behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:00 03/09/2015 
-- Design Name: 
-- Module Name:    spilte_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Split is

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : in std_logic_vector(15 downto 0);
		Even : out std_logic_vector(7 downto 0);
		Odd : out std_logic_vector(7 downto 0));
		
End Split;

Architecture Behavioral of Split is

begin
	
 Process( Start, Reset, Clock, Data) 
 
 begin 
 
 if( Start='0' or Reset='1') then
 
		Even <= x"00"; 
		Odd <=x"00";
	
 elsif( Clock'event and Clock='1') then 
 
		
		Even(7)<= Data(14);
		Even(6)<= Data(12);
		Even(5)<= Data(10);
		Even(4)<= Data(8);
		Even(3)<= Data(6);
		Even(2)<= Data(4);
		Even(1)<= Data(2);
		Even(0)<= Data(0);

		Odd(7)<= Data(15);
		Odd(6)<= Data(13);
		Odd(5)<= Data(11);
		Odd(4)<= Data(9);
		Odd(3)<= Data(7);
		Odd(2)<= Data(5);
		Odd(1)<= Data(3);
		Odd(0)<= Data(1);
		
 End if;

End process;

End Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:14 04/05/2015 
-- Design Name: 
-- Module Name:    PREDICT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;		
--use UNISIM.VComponents.all;

Entity  Predict is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(7 downto 0);	
		Odd	: in std_logic_vector(7 downto 0);
		Pout : out std_logic_vector( 7 downto 0);
		Cout  : out std_logic_vector(7 downto 0));
	  
End Predict ;

Architecture Behavioral of Predict is

begin

Process( Clock, Start, Reset, Even, Odd) 

begin 

	if(Start='0' or Reset='1') then 
	
			Cout <= x"00"; 
			Pout <= x"00"; 
	
	elsif( Clock'event and Clock='1') then 
	
				Cout<=Even-Odd;
				Pout<=Even-Odd;
	end if; 

end process;

End Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Create Date:    14:51:47 04/05/2015 
-- Design Name: 
-- Module Name:    Update - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Dependencies:
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Signed.ALL;
use IEEE.numeric_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity Update is

Port (  Reset : in std_logic;
		  Clock : in std_logic;
		  Start : in std_logic; 
		  Cout : in std_logic_vector( 7 downto 0); 
		  Even: in std_logic_vector(7 downto 0);
		  Uout : out std_logic_vector( 7 downto 0));

End Update;

architecture Behavioral of Update is


begin



Process ( Clock, Start, Reset, Cout, Even )  

begin 

if( Start='0' or Reset='1') then 
		
		Uout<=x"00"; 


	elsif( Clock'event and Clock='1') then 

		Uout(7) <= Even(7) xor '0'; 
		Uout(6 downto 0) <= Even(6 downto 0) xor Cout(7 downto 1); 
		

end if;
end process; 

		
		
			
End Behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:44 04/05/2015 
-- Design Name: 
-- Module Name:    Main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity LWT_2 is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic; 
		  Data : in std_logic_Vector( 7 downto 0); 
		  Pout : out std_logic_vector( 3 downto 0);
		  Uout : out std_logic_vector( 3 downto 0));
		  
End LWT_2;

Architecture Behavioral of LWT_2 is

signal Even, Odd : std_logic_Vector ( 3 downto 0); 
signal Cout  : std_logic_vector(3 downto 0);
	
Component Split1 is 

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : in std_logic_vector(7 downto 0);
		Even : out std_logic_vector(3 downto 0);
		Odd : out std_logic_vector(3 downto 0));

end Component;

Component Predict1  is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(3 downto 0);	
		Odd	: in std_logic_vector(3 downto 0);
		Cout  : out std_logic_vector(3 downto 0);
		Pout  : out std_logic_vector(3 downto 0));

end Component;


component Update1 is 

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;
		  Cout : in std_logic_vector( 3 downto 0); 
		  Even : in std_logic_vector( 3 downto 0);
		  Uout : out std_logic_vector( 3 downto 0));

end component;

begin

M1:Split1 

Port map( Clock =>Clock, Start=>Start, Reset=>Reset, Data=>Data, Even => Even , Odd=> Odd);


M2: Predict1

Port map(Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Cout=>Cout, Even=>Even, Odd=>Odd );

M3 : Update1 

Port Map ( Clock=>Clock,Start=>Start,Reset=>Reset,Cout=>Cout, Even=> Even, Uout=>Uout); 

End Behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:00 03/09/2015 
-- Design Name: 
-- Module Name:    spilte_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Split1 is

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : in std_logic_vector(7 downto 0);
		Even : out std_logic_vector(3 downto 0);
		Odd : out std_logic_vector(3 downto 0));
		
End Split1;

Architecture Behavioral of Split1 is

begin
	
 Process( Start, Reset, Clock, Data) 
 
 begin 
 
 if( Start='0' or Reset='1') then
 
		Even <= "0000"; 
		Odd <="0000";
	
 elsif( Clock'event and Clock='1') then 
 
		Even(3)<= Data(6);
		Even(2)<= Data(4);
		Even(1)<= Data(2);
		Even(0)<= Data(0);

		Odd(3)<= Data(7);
		Odd(2)<= Data(5);
		Odd(1)<= Data(3);
		Odd(0)<= Data(1);
		
 End if;

End process;

End Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:14 04/05/2015 
-- Design Name: 
-- Module Name:    PREDICT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;		
--use UNISIM.VComponents.all;

Entity  Predict1 is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(3 downto 0);	
		Odd	: in std_logic_vector(3 downto 0);
		Pout : out std_logic_vector( 3 downto 0);
		Cout  : out std_logic_vector(3 downto 0));
	  
End Predict1 ;

Architecture Behavioral of Predict1 is

begin

Process( Clock, Start, Reset, Even, Odd) 

begin 

	if(Start='0' or Reset='1') then 
	
			Cout <= "0000"; 
			Pout <= "0000"; 
	
	elsif( Clock'event and Clock='1') then 
	
				Cout<=Even-Odd;
				Pout<=Even-Odd;
	end if; 

end process;

End Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Create Date:    14:51:47 04/05/2015 
-- Design Name: 
-- Module Name:    Update - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Dependencies:
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Signed.ALL;
use IEEE.numeric_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity Update1 is

Port (  Reset : in std_logic;
		  Clock : in std_logic;
		  Start : in std_logic; 
		  Cout : in std_logic_vector( 3 downto 0); 
		  Even: in std_logic_vector(3 downto 0);
		  Uout : out std_logic_vector( 3 downto 0));

End Update1;

architecture Behavioral of Update1 is

begin


Process ( Clock, Start, Reset, Cout,Even)  

begin 

if( Start='0' or Reset='1') then 
		
		Uout<="0000"; 


elsif( Clock'event and Clock='1') then 

	Uout(3) <= Even(3) xor '0';
	Uout(2 downto 0) <= Even ( 2 downto 0) xor Cout( 3 downto 1);
	

end if;
end process; 

		
		
			

  
End Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:44 04/05/2015 
-- Design Name: 
-- Module Name:    Main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity LWT_3 is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic; 
		  Data : in std_logic_Vector( 3 downto 0); 
		  Pout : out std_logic_Vector( 1 downto 0);
		  Uout : out std_logic_Vector( 1 downto 0));
		  
End LWT_3;

Architecture Behavioral of LWT_3 is

signal Even, Odd : std_logic_vector(1 downto 0); 
signal Cout  : std_logic_vector(1 downto 0);
	
Component Split2 is 

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : in std_logic_vector(3 downto 0);
		Even : out std_logic_Vector( 1 downto 0);
		Odd : out std_logic_Vector( 1 downto 0));

end Component;

Component Predict2  is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_Vector( 1 downto 0);	
		Odd	: in std_logic_Vector( 1 downto 0);
		Cout  : out std_logic_Vector( 1 downto 0);
		Pout  : out std_logic_Vector( 1 downto 0));

end Component;


component Update2 is 

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;
		  Cout : in std_logic_Vector( 1 downto 0); 
		  Even : in std_logic_Vector( 1 downto 0);
		  Uout : out std_logic_Vector( 1 downto 0));

end component;

begin

M1:Split2 

Port map( Clock =>Clock, Start=>Start, Reset=>Reset, Data=>Data, Even => Even , Odd=> Odd);


M2: Predict2

Port map(Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Cout=>Cout, Even=>Even, Odd=>Odd );

M3 : Update2

Port Map ( Clock=>Clock,Start=>Start,Reset=>Reset,Cout=>Cout, Even=> Even, Uout=>Uout); 

End Behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:00 03/09/2015 
-- Design Name: 
-- Module Name:    spilte_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Split2 is

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : in std_logic_vector(3 downto 0);
		Even : out std_logic_Vector( 1 downto 0);
		Odd : out std_logic_Vector( 1 downto 0));
		
End Split2;

Architecture Behavioral of Split2 is

begin
	
 Process( Start, Reset, Clock, Data) 
 
 begin 
 
 if( Start='0' or Reset='1') then
 
		Even <= "00"; 
		Odd <="00";
	
 elsif( Clock'event and Clock='1') then 
 
		
		Even(1)<= Data(2);
		Even(0)<= Data(0);
		Odd(1)<= Data(3);
		Odd(0)<= Data(1);
		
 End if;

End process;

End Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:14 04/05/2015 
-- Design Name: 
-- Module Name:    PREDICT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;		
--use UNISIM.VComponents.all;

Entity  Predict2 is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_Vector( 1 downto 0);	
		Odd	: in std_logic_Vector( 1 downto 0);
		Pout : out std_logic_Vector( 1 downto 0);
		Cout  : out std_logic_Vector( 1 downto 0));
	  
End Predict2 ;

Architecture Behavioral of Predict2 is

begin


Process ( Clock, Start, Reset, Even,Odd)  

begin 

if( Start='0' or Reset='1') then 
		
		Cout<="00"; 
		Pout<="00"; 


elsif( Clock'event and Clock='1') then 

				Cout<=Even-Odd;
				Pout<=Even-Odd;		
	


end if;
end process; 

End Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Create Date:    14:51:47 04/05/2015 
-- Design Name: 
-- Module Name:    Update - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Dependencies:
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Signed.ALL;
use IEEE.numeric_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity Update2 is

Port (  Reset : in std_logic;
		  Clock : in std_logic;
		  Start : in std_logic; 
		  Cout : in std_logic_Vector( 1 downto 0); 
		  Even: in std_logic_Vector( 1 downto 0);
		  Uout : out std_logic_Vector( 1 downto 0));

End Update2;

architecture Behavioral of Update2 is

begin

Process ( Clock, Start, Reset, Cout,Even)  

begin 

if( Start='0' or Reset='1') then 
		
		Uout<="00"; 


elsif( Clock'event and Clock='1') then 

		Uout(1)<=Even(1) xor '0';
		Uout(0)<=Even(0) xor Cout(1);
		
end if;
end process; 

		
		
			

  
End Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:35:56 05/13/2015 
-- Design Name: 
-- Module Name:    Main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Inverse  is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic; 
		  Data_out : out std_logic_Vector(15 downto 0); 
		  LLL: in std_logic_vector( 1 downto 0);
		  LLH:  in std_logic_vector( 1 downto 0);
		  LHL: in std_logic_vector( 1 downto 0);
		  LHH: in std_logic_vector( 1 downto 0);
		  HLL: in std_logic_vector( 1 downto 0);
		  HLH: in std_logic_vector( 1 downto 0);
		  HHL: in std_logic_vector( 1 downto 0);
		  HHH: in std_logic_vector( 1 downto 0)); 

End Inverse ;

Architecture Behavioral of Inverse  is

signal H, L : std_logic_vector(7 downto 0); 
signal HH,HL, LH,LL: std_logic_vector( 3 downto 0); 


component Three_IDWT is 

Port ( 	Clock : in std_logic; 
			Start : in std_logic;
			Reset : in std_logic; 
			HH : out std_logic_vector( 3 downto 0); 
			HL : out std_logic_vector( 3 downto 0); 
			LH : out std_logic_vector( 3 downto 0); 
			LL : out std_logic_vector( 3 downto 0); 
			  LLL: in std_logic_vector( 1 downto 0);
			  LLH: in std_logic_vector( 1 downto 0);
			  LHL: in std_logic_vector( 1 downto 0);
			  LHH: in std_logic_vector( 1 downto 0);
			  HLL: in std_logic_vector( 1 downto 0);
			  HLH: in std_logic_vector( 1 downto 0);
			  HHL: in std_logic_vector( 1 downto 0);
			  HHH: in std_logic_vector( 1 downto 0)); 				


end component;

component Two_IDWT is

Port ( 	Clock : in std_logic; 
			Start : in std_logic;
			Reset : in std_logic; 
			H : out std_logic_vector(7 downto 0); 
			L : out std_logic_vector(7 downto 0); 
			HH : in std_logic_vector( 3 downto 0); 
			HL : in std_logic_vector( 3 downto 0); 
			LH : in std_logic_vector( 3 downto 0); 
			LL : in std_logic_vector( 3 downto 0)); 
			
end component; 



component  IDWT is 

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic; 
		  Data : out std_logic_Vector(15 downto 0); 
		  Pout : in std_logic_vector (7 downto 0);
		  Uout : in std_logic_vector(7 downto 0));

end component; 

 
begin



D1: Three_IDWT 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, HH=>HH, HL=>HL, LH=>LH, LL=>LL, LLL=>LLL, LLH=>LLH, LHL=>LHL, LHH=>LHH, HLL=>HLL, HLH=>HLH, HHL=>HHL, HHH=>HHH); 


D2 : Two_IDWT 

Port map( Clock=>Clock, Start=>Start, Reset=>Reset, H=>H, L=>L, HH=>HH, HL=>HL, LH=>LH, LL=>LL) ;

D3: IDWT

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>Data_out, Pout=>H, Uout=>L); 


End Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:13 05/13/2015 
-- Design Name: 
-- Module Name:    TWO_DWT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Two_DWT is

Port ( 	Clock : in std_logic; 
			Start : in std_logic;
			Reset : in std_logic; 
			H : in std_logic_vector(7 downto 0); 
			L : in std_logic_vector(7 downto 0); 
			HH : out std_logic_vector( 3 downto 0); 
			HL : out std_logic_vector( 3 downto 0); 
			LH : out std_logic_vector( 3 downto 0); 
			LL : out std_logic_vector( 3 downto 0)); 

End Two_DWT;

Architecture Behavioral of Two_DWT is

component LWT_2 is    ----------------- HIGH 

Port (  	Clock : in std_logic;
			Start : in std_logic; 
			Reset : in std_logic; 
			Data : in std_logic_Vector( 7 downto 0); 
			Pout : out std_logic_vector( 3 downto 0);
			Uout : out std_logic_vector( 3 downto 0));

end component; 


begin


P1: LWT_2 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>H, Pout=>HH, Uout=>HL); 


U1: LWT_2 			--- -Low Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>L, Pout=>LH, Uout=>LL); 


End Behavioral;

----------------------------------------------------------------------------------
-- Company: Vivek InfoTech
-- Engineer: 
-- 
-- Create Date:    12:46:13 05/13/2015 
-- Design Name: 
-- Module Name:    TWO_DWT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Three_IDWT is

Port ( 	Clock : in std_logic; 
			Start : in std_logic;
			Reset : in std_logic; 
			HH : out std_logic_vector( 3 downto 0); 
			HL : out std_logic_vector( 3 downto 0); 
			LH : out std_logic_vector( 3 downto 0); 
			LL : out std_logic_vector( 3 downto 0); 
			  LLL: in std_logic_vector( 1 downto 0);
			  LLH: in std_logic_vector( 1 downto 0);
			  LHL: in std_logic_vector( 1 downto 0);
			  LHH: in std_logic_vector( 1 downto 0);
			  HLL: in std_logic_vector( 1 downto 0);
			  HLH: in std_logic_vector( 1 downto 0);
			  HHL: in std_logic_vector( 1 downto 0);
			  HHH: in std_logic_vector( 1 downto 0)); 	

End Three_IDWT;

Architecture Behavioral of Three_IDWT is

component ILWT_3 is    ----------------- HIGH 

Port (  	Clock : in std_logic;
			Start : in std_logic; 
			Reset : in std_logic; 
			Data : out std_logic_Vector( 3 downto 0); 
			Pout : in std_logic_vector( 1 downto 0);
			Uout : in std_logic_vector( 1 downto 0));

end component; 


begin


HP: ILWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>HH, Pout=>HHH, Uout=>HHL); 


LP: ILWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>HL, Pout=>HLH, Uout=>HLL); 


HU: ILWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>LH, Pout=>LHH, Uout=>LHL); 


LU: ILWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>LL, Pout=>LLH, Uout=>LLL); 

End Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:13 05/13/2015 
-- Design Name: 
-- Module Name:    TWO_DWT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Three_DWT is

Port ( 	Clock : in std_logic; 
			Start : in std_logic;
			Reset : in std_logic; 
			HH : in std_logic_vector( 3 downto 0); 
			HL : in std_logic_vector( 3 downto 0); 
			LH : in std_logic_vector( 3 downto 0); 
			LL : in std_logic_vector( 3 downto 0); 
			LLL: out std_logic_vector(1 downto 0);
			LLH: out std_logic_vector(1 downto 0);
			LHL: out std_logic_vector(1 downto 0);
			LHH: out std_logic_vector(1 downto 0);
			HLL: out std_logic_vector(1 downto 0);
			HLH: out std_logic_vector(1 downto 0);
			HHL: out std_logic_vector(1 downto 0);
			HHH: out std_logic_vector(1 downto 0)); 


End Three_DWT;

Architecture Behavioral of Three_DWT is

component LWT_3 is    ----------------- HIGH 

Port (  	Clock : in std_logic;
			Start : in std_logic; 
			Reset : in std_logic; 
			Data : in std_logic_Vector( 3 downto 0); 
			Pout : out std_logic_vector(1 downto 0);
			Uout : out std_logic_vector(1 downto 0));

end component; 


begin


HP: LWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>HH, Pout=>HHH, Uout=>HHL); 


LP: LWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>HL, Pout=>HLH, Uout=>HLL); 


HU: LWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>LH, Pout=>LHH, Uout=>LHL); 


LU: LWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>LL, Pout=>LLH, Uout=>LLL); 

End Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:44 04/05/2015 
-- Design Name: 
-- Module Name:    Main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity  ILWT_2 is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;  
		  Pout : in std_logic_vector( 3 downto 0);
		  Uout : in std_logic_vector( 3 downto 0);
		  Data : out std_logic_Vector( 7 downto 0));

End  ILWT_2;

 Architecture Behavioral of  ILWT_2 is

signal Even, Odd : std_logic_Vector ( 3 downto 0); 

component IUpdate1 is 

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;
		  Pout : in std_logic_vector( 3 downto 0); 
		  Uout : in std_logic_vector( 3 downto 0);
		  Even : out std_logic_vector(3 downto 0));

end component;
	
Component IPredict1  is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(3 downto 0);	
		Pout  : in std_logic_vector(3 downto 0);
		Odd	: out std_logic_vector(3 downto 0));
		
end Component;

Component Merge1 is 

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Even : in std_logic_vector(3 downto 0);
		Odd : in std_logic_vector(3 downto 0);
		Data : out std_logic_vector(7 downto 0));

end Component;


begin


M1 : IUpdate1 

Port Map ( Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Even=> Even, Uout=>Uout); 


M2: IPredict1

Port map(Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Even=>Even, Odd=>Odd );

M3: Merge1  

Port map( Clock =>Clock, Start=>Start, Reset=>Reset, Data=>Data, Even => Even, Odd=> Odd);


End Behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:00 03/09/2015 
-- Design Name: 
-- Module Name:    spilte_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Merge1 is

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : out std_logic_vector(7 downto 0);
		Even : in std_logic_vector(3 downto 0);
		Odd : in std_logic_vector(3 downto 0));
		
End Merge1;

Architecture Behavioral of Merge1 is

begin
	
 Process( Start, Reset, Clock, Even, Odd) 
 
 begin 
 
 if( Start='0' or Reset='1') then
 
		Data <= x"00"; 

 elsif( Clock'event and Clock='1') then 
 
		Data(7) <= Odd(3); 
		Data(6) <= Even(3); 
		Data(5) <= Odd(2); 
		Data(4) <= Even(2); 
		Data(3) <= Odd(1); 
		Data(2) <= Even(1); 
		Data(1) <= Odd(0); 
		Data(0) <= Even(0); 
		
			
 End if;

End process;

End Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:14 04/05/2015 
-- Design Name: 
-- Module Name:    PREDICT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;		
--use UNISIM.VComponents.all;

Entity  IPredict1 is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(3 downto 0);	
		Odd	: out std_logic_vector(3 downto 0);
		Pout : in std_logic_vector( 3 downto 0));

End IPredict1 ;

Architecture Behavioral of IPredict1 is

begin

Process( Even, Pout) 

begin

			Odd <=Even+Pout;
			
end process;

End Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Create Date:    14:51:47 04/05/2015 
-- Design Name: 
-- Module Name:    Update - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Dependencies:
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Signed.ALL;
use IEEE.numeric_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity IUpdate1 is

Port (  Reset : in std_logic;
		  Clock : in std_logic;
		  Start : in std_logic; 
		  Pout : in std_logic_vector( 3 downto 0); 
		  Even: out std_logic_vector(3 downto 0);
		  Uout : in  std_logic_vector( 3 downto 0));

End IUpdate1;

architecture Behavioral of IUpdate1 is

begin



Process ( Clock, Start, Reset, Pout,Uout)  

begin 

	Even(3) <= Uout(3) xor '0';
	Even(2) <= Uout(2) xor Pout(3);
	Even(1) <= Uout(1) xor Pout(2);
	Even(0) <= Uout(0) xor Pout(0);
	

end process; 

		
		
		
  
End Behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:44 04/05/2015 
-- Design Name: 
-- Module Name:    Main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity  ILWT_2 is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;  
		  Pout : in std_logic_vector( 3 downto 0);
		  Uout : in std_logic_vector( 3 downto 0);
		  Data : out std_logic_Vector( 7 downto 0));

End  ILWT_2;

 Architecture Behavioral of  ILWT_2 is

signal Even, Odd : std_logic_Vector ( 3 downto 0); 

component IUpdate1 is 

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;
		  Pout : in std_logic_vector( 3 downto 0); 
		  Uout : in std_logic_vector( 3 downto 0);
		  Even : out std_logic_vector(3 downto 0));

end component;
	
Component IPredict1  is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(3 downto 0);	
		Pout  : in std_logic_vector(3 downto 0);
		Odd	: out std_logic_vector(3 downto 0));
		
end Component;

Component Merge1 is 

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Even : in std_logic_vector(3 downto 0);
		Odd : in std_logic_vector(3 downto 0);
		Data : out std_logic_vector(7 downto 0));

end Component;


begin


M1 : IUpdate1 

Port Map ( Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Even=> Even, Uout=>Uout); 


M2: IPredict1

Port map(Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Even=>Even, Odd=>Odd );

M3: Merge1  

Port map( Clock =>Clock, Start=>Start, Reset=>Reset, Data=>Data, Even => Even, Odd=> Odd);


End Behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:00 03/09/2015 
-- Design Name: 
-- Module Name:    spilte_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Merge1 is

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : out std_logic_vector(7 downto 0);
		Even : in std_logic_vector(3 downto 0);
		Odd : in std_logic_vector(3 downto 0));
		
End Merge1;

Architecture Behavioral of Merge1 is

begin
	
 Process( Start, Reset, Clock, Even, Odd) 
 
 begin 
 
 if( Start='0' or Reset='1') then
 
		Data <= x"00"; 

 elsif( Clock'event and Clock='1') then 
 
		Data(7) <= Odd(3); 
		Data(6) <= Even(3); 
		Data(5) <= Odd(2); 
		Data(4) <= Even(2); 
		Data(3) <= Odd(1); 
		Data(2) <= Even(1); 
		Data(1) <= Odd(0); 
		Data(0) <= Even(0); 
		
			
 End if;

End process;

End Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:14 04/05/2015 
-- Design Name: 
-- Module Name:    PREDICT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;		
--use UNISIM.VComponents.all;

Entity  IPredict1 is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(3 downto 0);	
		Odd	: out std_logic_vector(3 downto 0);
		Pout : in std_logic_vector( 3 downto 0));

End IPredict1 ;

Architecture Behavioral of IPredict1 is

begin

Process( Even, Pout) 

begin

			Odd <=Even+Pout;
			
end process;

End Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Create Date:    14:51:47 04/05/2015 
-- Design Name: 
-- Module Name:    Update - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Dependencies:
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Signed.ALL;
use IEEE.numeric_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity IUpdate1 is

Port (  Reset : in std_logic;
		  Clock : in std_logic;
		  Start : in std_logic; 
		  Pout : in std_logic_vector( 3 downto 0); 
		  Even: out std_logic_vector(3 downto 0);
		  Uout : in  std_logic_vector( 3 downto 0));

End IUpdate1;

architecture Behavioral of IUpdate1 is

begin



Process ( Clock, Start, Reset, Pout,Uout)  

begin 

	Even(3) <= Uout(3) xor '0';
	Even(2) <= Uout(2) xor Pout(3);
	Even(1) <= Uout(1) xor Pout(2);
	Even(0) <= Uout(0) xor Pout(0);
	

end process; 

		
		
		
  
End Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:44 04/05/2015 
-- Design Name: 
-- Module Name:    Main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity  IDWT is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;  
		  Pout : in std_logic_vector( 7 downto 0);
		  Uout : in std_logic_vector( 7 downto 0);
		  Data : out std_logic_Vector( 15 downto 0));

End  IDWT;

 Architecture Behavioral of  IDWT is

signal Even, Odd : std_logic_Vector ( 7 downto 0); 

component IUpdate is 

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;
		  Pout : in std_logic_vector( 7 downto 0); 
		  Uout : in std_logic_vector( 7 downto 0);
		  Even : out std_logic_vector( 7 downto 0));

end component;
	
Component IPredict  is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(7 downto 0);	
		Pout  : in std_logic_vector(7 downto 0);
		Odd	: out std_logic_vector(7 downto 0));
		
end Component;

Component Merge is 

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Even : in std_logic_vector(7 downto 0);
		Odd : in std_logic_vector(7 downto 0);
		Data : out std_logic_vector(15 downto 0));

end Component;


begin


M1 : IUpdate 

Port Map ( Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Even=> Even, Uout=>Uout); 


M2: IPredict

Port map(Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Even=>Even, Odd=>Odd );

M3: Merge  

Port map( Clock =>Clock, Start=>Start, Reset=>Reset, Data=>Data, Even => Even, Odd=> Odd);


End Behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:00 03/09/2015 
-- Design Name: 
-- Module Name:    spilte_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Merge is

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : out std_logic_vector(15 downto 0);
		Even : in std_logic_vector(7 downto 0);
		Odd : in std_logic_vector(7 downto 0));
		
End Merge;

Architecture Behavioral of Merge is

begin
	
 Process( Start, Reset, Clock, Even, Odd) 
 
 begin 
 
 if( Start='0' or Reset='1') then
 
		Data <= x"0000"; 

 elsif( Clock'event and Clock='1') then 
 
		Data(15) <= Odd(7); 
		Data(14) <= Even(7); 
		Data(13) <= Odd(6); 
		Data(12) <= Even(6); 
		Data(11) <= Odd(5); 
		Data(10) <= Even(5); 
		Data(9) <= Odd(4); 
		Data(8) <= Even(4); 
		Data(7) <= Odd(3); 
		Data(6) <= Even(3); 
		Data(5) <= Odd(2); 
		Data(4) <= Even(2); 
		Data(3) <= Odd(1); 
		Data(2) <= Even(1); 
		Data(1) <= Odd(0); 
		Data(0) <= Even(0); 
		
			
 End if;

End process;

End Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:14 04/05/2015 
-- Design Name: 
-- Module Name:    PREDICT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;		
--use UNISIM.VComponents.all;

Entity  IPredict is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_vector(7 downto 0);	
		Odd	: out std_logic_vector(7 downto 0);
		Pout : in std_logic_vector( 7 downto 0));

End IPredict ;

Architecture Behavioral of IPredict is

begin

Process( Even, Pout) 

begin

			Odd <=Even+Pout;
			
end process;

End Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Create Date:    14:51:47 04/05/2015 
-- Design Name: 
-- Module Name:    Update - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Dependencies:
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Signed.ALL;
use IEEE.numeric_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity IUpdate is

Port (  Reset : in std_logic;
		  Clock : in std_logic;
		  Start : in std_logic; 
		  Pout : in std_logic_vector( 7 downto 0); 
		  Even: out std_logic_vector(7 downto 0);
		  Uout : in  std_logic_vector( 7 downto 0));

End IUpdate;

architecture Behavioral of IUpdate is


begin



Process ( Clock, Start, Reset)  

begin 

	Even(7) <=Uout(7) xor '0'; 
	Even(6 downto 0) <=Uout(6 downto 0) xor Uout( 7 downto 1);
	
end process; 

		
		
		
  
End Behavioral;


----------------------------------------------------------------------------------
-- Company: 	Vivek InfoTech
-- Engineer: 
-- 
-- Create Date:    12:46:13 05/13/2015 
-- Design Name: 
-- Module Name:    TWO_DWT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Two_IDWT is

Port ( 	Clock : in std_logic; 
			Start : in std_logic;
			Reset : in std_logic; 
			H : out std_logic_vector(7 downto 0); 
			L : out std_logic_vector(7 downto 0); 
			HH : in std_logic_vector(3 downto 0); 
			HL : in std_logic_vector(3 downto 0); 
			LH : in std_logic_vector(3 downto 0); 
			LL : in std_logic_vector(3 downto 0)); 

End Two_IDWT;

Architecture Behavioral of Two_IDWT is

component ILWT_2 is    ----------------- HIGH 

Port (  	Clock : in std_logic;
			Start : in std_logic; 
			Reset : in std_logic; 
			Data : out std_logic_Vector( 7 downto 0); 
			Pout : in std_logic_vector(3 downto 0);
			Uout : in std_logic_vector(3 downto 0));

end component; 


begin


P1: ILWT_2 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>H, Pout=>HH, Uout=>HL); 


U1: ILWT_2 			--- -Low Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>L, Pout=>LH, Uout=>LL); 


End Behavioral;




----------------------------------------------------------------------------------
-- Company: Vivek InfoTech
-- Engineer: 
-- 
-- Create Date:    12:46:13 05/13/2015 
-- Design Name: 
-- Module Name:    TWO_DWT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Three_IDWT is

Port ( 	Clock : in std_logic; 
			Start : in std_logic;
			Reset : in std_logic; 
			HH : out std_logic_vector( 3 downto 0); 
			HL : out std_logic_vector( 3 downto 0); 
			LH : out std_logic_vector( 3 downto 0); 
			LL : out std_logic_vector( 3 downto 0); 
			  LLL: in std_logic_vector( 1 downto 0);
			  LLH: in std_logic_vector( 1 downto 0);
			  LHL: in std_logic_vector( 1 downto 0);
			  LHH: in std_logic_vector( 1 downto 0);
			  HLL: in std_logic_vector( 1 downto 0);
			  HLH: in std_logic_vector( 1 downto 0);
			  HHL: in std_logic_vector( 1 downto 0);
			  HHH: in std_logic_vector( 1 downto 0)); 	

End Three_IDWT;

Architecture Behavioral of Three_IDWT is

component ILWT_3 is    ----------------- HIGH 

Port (  	Clock : in std_logic;
			Start : in std_logic; 
			Reset : in std_logic; 
			Data : out std_logic_Vector( 3 downto 0); 
			Pout : in std_logic_vector( 1 downto 0);
			Uout : in std_logic_vector( 1 downto 0));

end component; 


begin


HP: ILWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>HH, Pout=>HHH, Uout=>HHL); 


LP: ILWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>HL, Pout=>HLH, Uout=>HLL); 


HU: ILWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>LH, Pout=>LHH, Uout=>LHL); 


LU: ILWT_3 			--- High Pass 

Port map ( Clock=> Clock, Start=>Start, Reset=>Reset, Data=>LL, Pout=>LLH, Uout=>LLL); 

End Behavioral;
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:55:44 04/05/2015 
-- Design Name: 
-- Module Name:    Main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity  ILWT_3 is

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;  
		  Pout : in std_logic_Vector( 1 downto 0);
		  Uout : in std_logic_Vector( 1 downto 0);
		  Data : out std_logic_Vector(3 downto 0));

End  ILWT_3;

 Architecture Behavioral of  ILWT_3 is

signal Even, Odd : std_logic_vector(1 downto 0); 

component IUpdate2 is 

Port (  Clock : in std_logic;
		  Start : in std_logic; 
		  Reset : in std_logic;
		  Pout : in std_logic_Vector( 1 downto 0); 
		  Uout : in std_logic_Vector( 1 downto 0);
		  Even : out std_logic_Vector( 1 downto 0));

end component;
	
Component IPredict2  is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_Vector( 1 downto 0);	
		Pout  : in std_logic_Vector( 1 downto 0);
		Odd	: out std_logic_Vector( 1 downto 0));
		
end Component;

Component Merge2 is 

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Even : in std_logic_Vector( 1 downto 0);
		Odd : in std_logic_Vector( 1 downto 0);
		Data : out std_logic_vector(3 downto 0));

end Component;


begin


M1 : IUpdate2 

Port Map ( Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Even=> Even, Uout=>Uout); 


M2: IPredict2

Port map(Clock=>Clock,Start=>Start,Reset=>Reset,Pout=>Pout, Even=>Even, Odd=>Odd );

M3: Merge2 

Port map( Clock =>Clock, Start=>Start, Reset=>Reset, Data=>Data, Even => Even, Odd=> Odd);


End Behavioral;




----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:14:00 03/09/2015 
-- Design Name: 
-- Module Name:    spilte_1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

Entity Merge2 is

Port(	Clock :in std_logic;
		Start :in std_logic;
		Reset : in std_logic;
		Data : out std_logic_vector(3 downto 0);
		Even : in std_logic_Vector( 1 downto 0);
		Odd : in std_logic_Vector( 1 downto 0));
		
End Merge2;

Architecture Behavioral of Merge2 is

begin
	
 Process( Start, Reset, Clock, Even, Odd) 
 
 begin 
 
 if( Start='0' or Reset='1') then
 
		Data <= "0000"; 

 elsif( Clock'event and Clock='1') then 
 
		Data(3) <= Odd(1); 
		Data(2) <= Even(1); 
		Data(1) <= Odd(0); 
		Data(0) <= Even(0); 
		
			
 End if;

End process;

End Behavioral;



----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:57:14 04/05/2015 
-- Design Name: 
-- Module Name:    PREDICT - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;		
--use UNISIM.VComponents.all;

Entity  IPredict2 is

Port(	Clock : in std_logic;
		Start : in std_logic;
		Reset : in std_logic;
		Even 	: in std_logic_Vector( 1 downto 0);	
		Odd	: out std_logic_Vector( 1 downto 0);
		Pout : in std_logic_Vector( 1 downto 0));

End IPredict2 ;

Architecture Behavioral of IPredict2 is


begin

Process ( Clock, Pout, Even) 

 begin 
 if( Start='0' or Reset='1') then
 
		Odd <= "00"; 

 elsif( Clock'event and Clock='1') then 
	
		Odd<= Pout + Even;
		
	end if;
		
end process; 




		

End Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- Create Date:    14:51:47 04/05/2015 
-- Design Name: 
-- Module Name:    Update - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
-- Dependencies:
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_Signed.ALL;
use IEEE.numeric_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

Entity IUpdate2 is

Port (  Reset : in std_logic;
		  Clock : in std_logic;
		  Start : in std_logic; 
		  Pout : in std_logic_Vector( 1 downto 0); 
		  Even: out std_logic_Vector( 1 downto 0);
		  Uout : in  std_logic_Vector( 1 downto 0));

End IUpdate2;

architecture Behavioral of IUpdate2 is

begin

Process ( Clock, Pout, Uout) 

begin 

if( Start='0' or Reset='1') then
 
		Even <= "00"; 

 elsif( Clock'event and Clock='1') then 
	

	Even(1) <= Uout(1) xor '0';
	Even(0) <= Uout(0) xor Pout(1); 

		
end if; 
		end process;
		
  
End Behavioral;


