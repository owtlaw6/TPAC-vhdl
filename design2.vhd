-- Code your design here
library IEEE;
use IEEE.std_logic_1164.all;

ENTITY numarator IS
	GENERIC( delay: TIME := 10 ns; max_val: INTEGER := 16);
	PORT(clock, reset, load: IN BIT;
		intrare_paralela: IN INTEGER;
        minus2: IN BIT;
		iesire: OUT INTEGER);
END numarator;

ARCHITECTURE behave OF numarator IS
--declaratii de semnale, componente, etc
BEGIN

PROCESS( clock, reset)
	VARIABLE temp: INTEGER;
BEGIN

	IF reset='0' THEN
		temp := 0;
	ELSIF clock='1' AND clock'EVENT and clock'LAST_VALUE='0' THEN
		IF load='1' THEN
			temp := intrare_paralela;
		ELSE
        	IF minus2 = '0' THEN
                temp := (temp-1) MOD max_val;
            ELSE
            	temp := (temp-2) MOD max_val;
            END IF;
		END IF;
	END IF;

	iesire <= temp AFTER delay;
END PROCESS;

END ARCHITECTURE behave;