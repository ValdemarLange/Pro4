--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
--Date        : Wed May 29 09:20:59 2024
--Host        : DESKTOP-L20MO39 running 64-bit major release  (build 9200)
--Command     : generate_target Spimigiroven.bd
--Design      : Spimigiroven
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Spimigiroven is
  port (
    IN1_pan : out STD_LOGIC;
    IN1_tilt : out STD_LOGIC;
    IN2_pan : out STD_LOGIC;
    IN2_tilt : out STD_LOGIC;
    clk : in STD_LOGIC;
    miso : out STD_LOGIC;
    mosi : in STD_LOGIC;
    pan_A_in : in STD_LOGIC;
    pan_B_in : in STD_LOGIC;
    pan_Hall_homing : in STD_LOGIC;
    pwm_pan : out STD_LOGIC_VECTOR ( 0 to 0 );
    pwm_tilt : out STD_LOGIC_VECTOR ( 0 to 0 );
    rst : in STD_LOGIC;
    sclk : in STD_LOGIC;
    ss : in STD_LOGIC;
    tilt_A_in : in STD_LOGIC;
    tilt_B_in : in STD_LOGIC;
    tilt_Hall_homing : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of Spimigiroven : entity is "Spimigiroven,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=Spimigiroven,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=18,numReposBlks=18,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=17,numPkgbdBlks=0,bdsource=USER,da_clkrst_cnt=1,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of Spimigiroven : entity is "Spimigiroven.hwdef";
end Spimigiroven;

architecture STRUCTURE of Spimigiroven is
  component Spimigiroven_encoder_M1_pulse_0_0 is
  port (
    B_in : in STD_LOGIC;
    A_in : in STD_LOGIC;
    rst : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component Spimigiroven_encoder_M1_pulse_0_0;
  component Spimigiroven_state_test_0_0 is
  port (
    rst : in STD_LOGIC;
    sclk : in STD_LOGIC;
    mosi : in STD_LOGIC;
    miso : out STD_LOGIC;
    ss : in STD_LOGIC;
    data_to_send : in STD_LOGIC_VECTOR ( 11 downto 0 );
    data_received : out STD_LOGIC_VECTOR ( 11 downto 0 );
    motor_select : out STD_LOGIC;
    direction_select : out STD_LOGIC
  );
  end component Spimigiroven_state_test_0_0;
  component Spimigiroven_encoder_decider_0_0 is
  port (
    intr : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 11 downto 0 );
    tilt_motor : in STD_LOGIC_VECTOR ( 10 downto 0 );
    pan_motor : in STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component Spimigiroven_encoder_decider_0_0;
  component Spimigiroven_Homing_hall_sensor_0_0 is
  port (
    rst : in STD_LOGIC;
    tilt_Hall : in STD_LOGIC;
    pan_Hall : in STD_LOGIC;
    tilt_out : out STD_LOGIC;
    pan_out : out STD_LOGIC
  );
  end component Spimigiroven_Homing_hall_sensor_0_0;
  component Spimigiroven_counter_0_0 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Spimigiroven_counter_0_0;
  component Spimigiroven_is_larger_comparator_0_0 is
  port (
    a : in STD_LOGIC_VECTOR ( 7 downto 0 );
    b : in STD_LOGIC_VECTOR ( 7 downto 0 );
    y : out STD_LOGIC
  );
  end component Spimigiroven_is_larger_comparator_0_0;
  component Spimigiroven_clock_divider_0_0 is
  port (
    pynq_clock : in STD_LOGIC;
    output_clock : out STD_LOGIC
  );
  end component Spimigiroven_clock_divider_0_0;
  component Spimigiroven_is_larger_comparator_0_1 is
  port (
    a : in STD_LOGIC_VECTOR ( 7 downto 0 );
    b : in STD_LOGIC_VECTOR ( 7 downto 0 );
    y : out STD_LOGIC
  );
  end component Spimigiroven_is_larger_comparator_0_1;
  component Spimigiroven_motor_decider_tilt_0_6 is
  port (
    data_inp : in STD_LOGIC_VECTOR ( 11 downto 0 );
    en : in STD_LOGIC;
    tilt_led : out STD_LOGIC;
    tilt_motor : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Spimigiroven_motor_decider_tilt_0_6;
  component Spimigiroven_motor_decider_pan_0_2 is
  port (
    data_inp : in STD_LOGIC_VECTOR ( 11 downto 0 );
    en : in STD_LOGIC;
    pan_led : out STD_LOGIC;
    pan_motor : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Spimigiroven_motor_decider_pan_0_2;
  component Spimigiroven_not_gate_0_1 is
  port (
    inp : in STD_LOGIC;
    outp : out STD_LOGIC
  );
  end component Spimigiroven_not_gate_0_1;
  component Spimigiroven_counter_0_2 is
  port (
    clk : in STD_LOGIC;
    en : in STD_LOGIC;
    cnt : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component Spimigiroven_counter_0_2;
  component Spimigiroven_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component Spimigiroven_xlconstant_0_0;
  component Spimigiroven_delay_0_1 is
  port (
    inp : in STD_LOGIC_VECTOR ( 11 downto 0 );
    clock : in STD_LOGIC;
    outp : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  end component Spimigiroven_delay_0_1;
  component Spimigiroven_not_gate_1_1 is
  port (
    inp : in STD_LOGIC;
    outp : out STD_LOGIC
  );
  end component Spimigiroven_not_gate_1_1;
  component Spimigiroven_not_gate_3_0 is
  port (
    inp : in STD_LOGIC;
    outp : out STD_LOGIC
  );
  end component Spimigiroven_not_gate_3_0;
  component Spimigiroven_encoder_tilt_pulse_0_0 is
  port (
    B_in : in STD_LOGIC;
    A_in : in STD_LOGIC;
    rst : in STD_LOGIC;
    count : out STD_LOGIC_VECTOR ( 10 downto 0 )
  );
  end component Spimigiroven_encoder_tilt_pulse_0_0;
  component Spimigiroven_dir_pwm_block_0_0 is
  port (
    motor_sel : in STD_LOGIC;
    dir_sel : in STD_LOGIC;
    pwm_pan : in STD_LOGIC;
    pwm_tilt : in STD_LOGIC;
    IN1_pan : out STD_LOGIC;
    IN2_pan : out STD_LOGIC;
    IN1_tilt : out STD_LOGIC;
    IN2_tilt : out STD_LOGIC
  );
  end component Spimigiroven_dir_pwm_block_0_0;
  signal Homing_hall_sensor_0_pan_out : STD_LOGIC;
  signal Homing_hall_sensor_0_tilt_out : STD_LOGIC;
  signal clk_1 : STD_LOGIC;
  signal clock_divider_0_output_clock : STD_LOGIC;
  signal counter_0_cnt : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal counter_1_cnt : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal delay_0_outp : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal dir_pwm_block_0_IN1_pan : STD_LOGIC;
  signal dir_pwm_block_0_IN1_tilt : STD_LOGIC;
  signal dir_pwm_block_0_IN2_pan : STD_LOGIC;
  signal dir_pwm_block_0_IN2_tilt : STD_LOGIC;
  signal encoder_M1_pulse_0_count : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal encoder_decider_0_data_out : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal encoder_tilt_pulse_0_count : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal is_larger_comparator_0_y : STD_LOGIC;
  signal is_larger_comparator_1_y : STD_LOGIC;
  signal mosi_1 : STD_LOGIC;
  signal motor_decider_1_tilt_motor : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal motor_decider_pan_0_pan_motor : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal not_gate_1_outp : STD_LOGIC;
  signal not_gate_3_outp : STD_LOGIC;
  signal not_gate_4_outp : STD_LOGIC;
  signal pan_A_in_1 : STD_LOGIC;
  signal pan_B_in_1 : STD_LOGIC;
  signal pan_Hall_homing_1 : STD_LOGIC;
  signal rst_1 : STD_LOGIC;
  signal sclk_1 : STD_LOGIC;
  signal ss_1 : STD_LOGIC;
  signal state_test_0_data_received : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal state_test_0_direction_select : STD_LOGIC;
  signal state_test_0_miso : STD_LOGIC;
  signal state_test_0_motor_select : STD_LOGIC;
  signal tilt_A_in_1 : STD_LOGIC;
  signal tilt_B_in_1 : STD_LOGIC;
  signal tilt_Hall_homing_1 : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_motor_decider_pan_0_pan_led_UNCONNECTED : STD_LOGIC;
  signal NLW_motor_decider_tilt_0_tilt_led_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 CLK.CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN Spimigiroven_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 RST.RST RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  IN1_pan <= dir_pwm_block_0_IN1_pan;
  IN1_tilt <= dir_pwm_block_0_IN1_tilt;
  IN2_pan <= dir_pwm_block_0_IN2_pan;
  IN2_tilt <= dir_pwm_block_0_IN2_tilt;
  clk_1 <= clk;
  miso <= state_test_0_miso;
  mosi_1 <= mosi;
  pan_A_in_1 <= pan_A_in;
  pan_B_in_1 <= pan_B_in;
  pan_Hall_homing_1 <= pan_Hall_homing;
  pwm_pan(0) <= xlconstant_0_dout(0);
  pwm_tilt(0) <= xlconstant_0_dout(0);
  rst_1 <= rst;
  sclk_1 <= sclk;
  ss_1 <= ss;
  tilt_A_in_1 <= tilt_A_in;
  tilt_B_in_1 <= tilt_B_in;
  tilt_Hall_homing_1 <= tilt_Hall_homing;
Homing_hall_sensor_0: component Spimigiroven_Homing_hall_sensor_0_0
     port map (
      pan_Hall => pan_Hall_homing_1,
      pan_out => Homing_hall_sensor_0_pan_out,
      rst => rst_1,
      tilt_Hall => tilt_Hall_homing_1,
      tilt_out => Homing_hall_sensor_0_tilt_out
    );
clock_divider_0: component Spimigiroven_clock_divider_0_0
     port map (
      output_clock => clock_divider_0_output_clock,
      pynq_clock => clk_1
    );
counter_0: component Spimigiroven_counter_0_0
     port map (
      clk => clock_divider_0_output_clock,
      cnt(7 downto 0) => counter_0_cnt(7 downto 0),
      en => xlconstant_0_dout(0)
    );
counter_1: component Spimigiroven_counter_0_2
     port map (
      clk => clock_divider_0_output_clock,
      cnt(7 downto 0) => counter_1_cnt(7 downto 0),
      en => xlconstant_0_dout(0)
    );
delay_0: component Spimigiroven_delay_0_1
     port map (
      clock => clk_1,
      inp(11 downto 0) => state_test_0_data_received(11 downto 0),
      outp(11 downto 0) => delay_0_outp(11 downto 0)
    );
dir_pwm_block_0: component Spimigiroven_dir_pwm_block_0_0
     port map (
      IN1_pan => dir_pwm_block_0_IN1_pan,
      IN1_tilt => dir_pwm_block_0_IN1_tilt,
      IN2_pan => dir_pwm_block_0_IN2_pan,
      IN2_tilt => dir_pwm_block_0_IN2_tilt,
      dir_sel => state_test_0_direction_select,
      motor_sel => state_test_0_motor_select,
      pwm_pan => not_gate_4_outp,
      pwm_tilt => not_gate_3_outp
    );
encoder_M1_pulse_0: component Spimigiroven_encoder_M1_pulse_0_0
     port map (
      A_in => pan_B_in_1,
      B_in => pan_A_in_1,
      count(10 downto 0) => encoder_M1_pulse_0_count(10 downto 0),
      rst => Homing_hall_sensor_0_pan_out
    );
encoder_decider_0: component Spimigiroven_encoder_decider_0_0
     port map (
      data_out(11 downto 0) => encoder_decider_0_data_out(11 downto 0),
      intr => ss_1,
      pan_motor(10 downto 0) => encoder_M1_pulse_0_count(10 downto 0),
      tilt_motor(10 downto 0) => encoder_tilt_pulse_0_count(10 downto 0)
    );
encoder_tilt_pulse_0: component Spimigiroven_encoder_tilt_pulse_0_0
     port map (
      A_in => tilt_B_in_1,
      B_in => tilt_A_in_1,
      count(10 downto 0) => encoder_tilt_pulse_0_count(10 downto 0),
      rst => Homing_hall_sensor_0_tilt_out
    );
is_larger_comparator_0: component Spimigiroven_is_larger_comparator_0_0
     port map (
      a(7 downto 0) => counter_0_cnt(7 downto 0),
      b(7 downto 0) => motor_decider_1_tilt_motor(7 downto 0),
      y => is_larger_comparator_0_y
    );
is_larger_comparator_1: component Spimigiroven_is_larger_comparator_0_1
     port map (
      a(7 downto 0) => counter_1_cnt(7 downto 0),
      b(7 downto 0) => motor_decider_pan_0_pan_motor(7 downto 0),
      y => is_larger_comparator_1_y
    );
motor_decider_pan_0: component Spimigiroven_motor_decider_pan_0_2
     port map (
      data_inp(11 downto 0) => delay_0_outp(11 downto 0),
      en => not_gate_1_outp,
      pan_led => NLW_motor_decider_pan_0_pan_led_UNCONNECTED,
      pan_motor(7 downto 0) => motor_decider_pan_0_pan_motor(7 downto 0)
    );
motor_decider_tilt_0: component Spimigiroven_motor_decider_tilt_0_6
     port map (
      data_inp(11 downto 0) => state_test_0_data_received(11 downto 0),
      en => state_test_0_motor_select,
      tilt_led => NLW_motor_decider_tilt_0_tilt_led_UNCONNECTED,
      tilt_motor(7 downto 0) => motor_decider_1_tilt_motor(7 downto 0)
    );
not_gate_1: component Spimigiroven_not_gate_0_1
     port map (
      inp => state_test_0_motor_select,
      outp => not_gate_1_outp
    );
not_gate_3: component Spimigiroven_not_gate_1_1
     port map (
      inp => is_larger_comparator_0_y,
      outp => not_gate_3_outp
    );
not_gate_4: component Spimigiroven_not_gate_3_0
     port map (
      inp => is_larger_comparator_1_y,
      outp => not_gate_4_outp
    );
state_test_0: component Spimigiroven_state_test_0_0
     port map (
      data_received(11 downto 0) => state_test_0_data_received(11 downto 0),
      data_to_send(11 downto 0) => encoder_decider_0_data_out(11 downto 0),
      direction_select => state_test_0_direction_select,
      miso => state_test_0_miso,
      mosi => mosi_1,
      motor_select => state_test_0_motor_select,
      rst => rst_1,
      sclk => sclk_1,
      ss => ss_1
    );
xlconstant_0: component Spimigiroven_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
end STRUCTURE;
