-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:module_ref:motor_decider_tilt:1.0
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY Spimigiroven_motor_decider_tilt_0_6 IS
  PORT (
    data_inp : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    en : IN STD_LOGIC;
    tilt_led : OUT STD_LOGIC;
    tilt_motor : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END Spimigiroven_motor_decider_tilt_0_6;

ARCHITECTURE Spimigiroven_motor_decider_tilt_0_6_arch OF Spimigiroven_motor_decider_tilt_0_6 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF Spimigiroven_motor_decider_tilt_0_6_arch: ARCHITECTURE IS "yes";
  COMPONENT motor_decider_tilt IS
    GENERIC (
      n_bits : INTEGER
    );
    PORT (
      data_inp : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
      en : IN STD_LOGIC;
      tilt_led : OUT STD_LOGIC;
      tilt_motor : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT motor_decider_tilt;
BEGIN
  U0 : motor_decider_tilt
    GENERIC MAP (
      n_bits => 12
    )
    PORT MAP (
      data_inp => data_inp,
      en => en,
      tilt_led => tilt_led,
      tilt_motor => tilt_motor
    );
END Spimigiroven_motor_decider_tilt_0_6_arch;