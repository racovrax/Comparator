library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dublu_comparator is 
 port ( 
 swt : in std_logic_vector(11 downto 0); 
 led : out std_logic_vector(15 downto 0);
 clk_in  : in std_logic
 );
end dublu_comparator; 

architecture Behavioral of dublu_comparator is
    -- Declarari semnale
    signal saved_x : std_logic_vector(3 downto 0);
    signal saved_y : std_logic_vector(3 downto 0);
    signal saved_z : std_logic_vector(3 downto 0);
    
    -- Main
    begin
        process(swt)
    begin
        -- Citim numerele de la switch-uri
        saved_x <= swt(3 downto 0);
        saved_y <= swt(7 downto 4);
        saved_z <= swt(11 downto 8);
        
        -- Reprezentam numerele, in format binar, folosind led-uri
        led(11 downto 0) <= swt(11 downto 0);

    end process;

    process (clk_in)
    begin
        -- Aprindem ledurile "rezultat" aferente primului comparator
        if saved_x < saved_y then
            led(12) <= '1';
            led(13) <= '0';
        elsif saved_x > saved_y then
            led(12) <= '0';
            led(13) <= '0';
        else
            led(14) <= '0';
            led(13) <= '1';
        end if;
        
        -- Aprindem ledurile "rezultat" aferente celui de al 2-lea comparator
        if saved_x < saved_z then
            led(14) <= '1';
            led(15) <= '0';
        elsif saved_x > saved_z then
            led(14) <= '0';
            led(15) <= '0';
        else
            led(14) <= '0';
            led(15) <= '1';
        end if;

    end process;
end Behavioral; 
 
