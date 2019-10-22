############################################################################
### KC705 Rev1.5
############################################################################

# Set calibration configuration for KC705 SODIMM
set_property slave_banks {32 34} [get_iobanks 33]
# alterantive method: set_property slave_banks {32 34} [get_iobanks 33]

# Buttons
set_property -dict {PACKAGE_PIN G12 IOSTANDARD LVCMOS25} [get_ports cpu_reset]

## To use FMC JTAG
set_property -dict { PACKAGE_PIN AD23  IOSTANDARD LVCMOS25 } [get_ports { trst_n }];
set_property -dict { PACKAGE_PIN AE23  IOSTANDARD LVCMOS25 } [get_ports { tck    }];
set_property -dict { PACKAGE_PIN AF20  IOSTANDARD LVCMOS25 } [get_ports { tdi    }];
set_property -dict { PACKAGE_PIN AG20  IOSTANDARD LVCMOS25 } [get_ports { tdo    }];
set_property -dict { PACKAGE_PIN AH21  IOSTANDARD LVCMOS25 } [get_ports { tms    }];

## UART
set_property -dict {PACKAGE_PIN K24 IOSTANDARD LVCMOS25} [get_ports {tx}];
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS25} [get_ports {rx}];


## LEDs
set_property -dict {PACKAGE_PIN AB8 IOSTANDARD LVCMOS15}  [get_ports {led[0]}]
set_property -dict {PACKAGE_PIN AA8 IOSTANDARD LVCMOS15}  [get_ports {led[1]}]
set_property -dict {PACKAGE_PIN AC9 IOSTANDARD LVCMOS15}  [get_ports {led[2]}]
set_property -dict {PACKAGE_PIN AB9 IOSTANDARD LVCMOS15}  [get_ports {led[3]}]
set_property -dict {PACKAGE_PIN AE26 IOSTANDARD LVCMOS25} [get_ports {led[4]}]
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS25}  [get_ports {led[5]}]
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS25}  [get_ports {led[6]}]
set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS25}  [get_ports {led[7]}]

## Switches
set_property -dict {PACKAGE_PIN Y29  IOSTANDARD LVCMOS25} [get_ports {sw[0]}]; #4-Pole DIP Switch
set_property -dict {PACKAGE_PIN W29  IOSTANDARD LVCMOS25} [get_ports {sw[1]}]; #4-Pole DIP Switch
set_property -dict {PACKAGE_PIN AA28 IOSTANDARD LVCMOS25} [get_ports {sw[2]}]; #4-Pole DIP Switch
set_property -dict {PACKAGE_PIN Y28  IOSTANDARD LVCMOS25} [get_ports {sw[3]}]; #4-Pole DIP Switch

## Fan Control
set_property -dict {PACKAGE_PIN L26 IOSTANDARD LVCMOS25} [get_ports {fan_pwm}];
#set_property -dict { PACKAGE_PIN V21   IOSTANDARD LVCMOS33 } [get_ports { FAN_TACH }]; #IO_L22P_T3_A05_D21_14 Sch=fan_tac

## Ethernet
set_property -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS25} [get_ports { eth_rst_n }]; #IO_L14N_T2_SRCC_12 Sch=eth_phyrst_n
set_property -dict {PACKAGE_PIN M28 IOSTANDARD LVCMOS25} [get_ports { eth_txck }]; #IO_L14P_T2_SRCC_33 Sch=eth_tx_clk
set_property -dict {PACKAGE_PIN M27 IOSTANDARD LVCMOS25} [get_ports { eth_txctl }]; #IO_L20P_T3_33 Sch=eth_tx_en
set_property -dict {PACKAGE_PIN N27 IOSTANDARD LVCMOS25} [get_ports { eth_txd[0] }]; #IO_L22N_T3_33 Sch=eth_tx_d[0]
set_property -dict {PACKAGE_PIN N25 IOSTANDARD LVCMOS25} [get_ports { eth_txd[1] }]; #IO_L17P_T2_33 Sch=eth_tx_d[1]
set_property -dict {PACKAGE_PIN M29 IOSTANDARD LVCMOS25} [get_ports { eth_txd[2] }]; #IO_L18N_T2_33 Sch=eth_tx_d[2]
set_property -dict {PACKAGE_PIN L28 IOSTANDARD LVCMOS25} [get_ports { eth_txd[3] }]; #IO_L17N_T2_33 Sch=eth_tx_d[3]
set_property -dict {PACKAGE_PIN U30 IOSTANDARD LVCMOS25} [get_ports { eth_rxd[0] }]; #IO_L21N_T3_DQS_33 Sch=eth_rx_d[0]
set_property -dict {PACKAGE_PIN U27 IOSTANDARD LVCMOS25} [get_ports { eth_rxck }]; #IO_L13P_T2_MRCC_33 Sch=eth_rx_clk
set_property -dict {PACKAGE_PIN R28 IOSTANDARD LVCMOS25} [get_ports { eth_rxctl }]; #IO_L18P_T2_33 Sch=eth_rx_ctl
set_property -dict {PACKAGE_PIN U25 IOSTANDARD LVCMOS25} [get_ports { eth_rxd[1] }]; #IO_L21P_T3_DQS_33 Sch=eth_rx_d[1]
set_property -dict {PACKAGE_PIN T25 IOSTANDARD LVCMOS25} [get_ports { eth_rxd[2] }]; #IO_L20N_T3_33 Sch=eth_rx_d[2]
set_property -dict {PACKAGE_PIN U28 IOSTANDARD LVCMOS25} [get_ports { eth_rxd[3] }]; #IO_L22P_T3_33 Sch=eth_rx_d[3]
set_property -dict {PACKAGE_PIN R23 IOSTANDARD LVCMOS25} [get_ports { eth_mdc }]; #IO_L23P_T3_33 Sch=eth_mdc
set_property -dict {PACKAGE_PIN J21 IOSTANDARD LVCMOS25} [get_ports { eth_mdio }]; #IO_L23N_T3_33 Sch=eth_mdio

#set_property -dict {PACKAGE_PIN AK15  IOSTANDARD LVCMOS18} [get_ports { eth_pme_b }]; #IO_L1N_T0_32 Sch=eth_pmeb
#set_property -dict {PACKAGE_PIN AK16  IOSTANDARD LVCMOS18} [get_ports { eth_int_b }]; #IO_L1P_T0_32 Sch=eth_intb

#############################################
# Ethernet Constraints for 1Gb/s
#############################################
# Modified for 125MHz receive clock
create_clock -period 8.000 -name eth_rxck [get_ports eth_rxck]

set_clock_groups -asynchronous -group [get_clocks eth_rxck -include_generated_clocks]
set_clock_groups -asynchronous -group [get_clocks clk_out2_xlnx_clk_gen]

#############################################
## SD Card
#############################################
set_property -dict {PACKAGE_PIN AB23 IOSTANDARD LVCMOS25} [get_ports spi_clk_o];
set_property -dict {PACKAGE_PIN AC21 IOSTANDARD LVCMOS25} [get_ports spi_ss];
set_property -dict {PACKAGE_PIN AC20 IOSTANDARD LVCMOS25} [get_ports spi_miso];
set_property -dict {PACKAGE_PIN AB22 IOSTANDARD LVCMOS25} [get_ports spi_mosi];
#set_property -dict { PACKAGE_PIN P28   IOSTANDARD LVCMOS33 } [get_ports { sd_cd }]; #IO_L8N_T1_D12_14 Sch=sd_cd
#set_property -dict { PACKAGE_PIN R29   IOSTANDARD LVCMOS33 } [get_ports { sd_cmd }]; #IO_L7N_T1_D10_14 Sch=sd_cmd
#set_property -dict { PACKAGE_PIN R26   IOSTANDARD LVCMOS33 } [get_ports { sd_dat[0] }]; #IO_L10N_T1_D15_14 Sch=sd_dat[0]
#set_property -dict { PACKAGE_PIN R30   IOSTANDARD LVCMOS33 } [get_ports { sd_dat[1] }]; #IO_L9P_T1_DQS_14 Sch=sd_dat[1]
#set_property -dict { PACKAGE_PIN P29   IOSTANDARD LVCMOS33 } [get_ports { sd_dat[2] }]; #IO_L7P_T1_D09_14 Sch=sd_dat[2]
#set_property -dict { PACKAGE_PIN T30   IOSTANDARD LVCMOS33 } [get_ports { sd_dat[3] }]; #IO_L9N_T1_DQS_D13_14 Sch=sd_dat[3]
#set_property -dict { PACKAGE_PIN AE24  IOSTANDARD LVCMOS33 } [get_ports { sd_reset }]; #IO_L12N_T1_MRCC_12 Sch=sd_reset
#set_property -dict { PACKAGE_PIN R28   IOSTANDARD LVCMOS33 } [get_ports { sd_clk }]; #IO_L11P_T1_SRCC_14 Sch=sd_sclk

# create_generated_clock -name sd_fast_clk -source [get_pins clk_mmcm/sd_sys_clk] -divide_by 2 [get_pins chipset_impl/piton_sd_top/sdc_controller/clock_divider0/fast_clk_reg/Q]
# create_generated_clock -name sd_slow_clk -source [get_pins clk_mmcm/sd_sys_clk] -divide_by 200 [get_pins chipset_impl/piton_sd_top/sdc_controller/clock_divider0/slow_clk_reg/Q]
# create_generated_clock -name sd_clk_out -source [get_pins sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_fast_clk [get_ports sd_clk_out]
# create_generated_clock -name sd_clk_out_1 -source [get_pins sd_clk_oddr/C] -divide_by 1 -add -master_clock sd_slow_clk [get_ports sd_clk_out]

# create_clock -period 40.000 -name VIRTUAL_sd_fast_clk -waveform {0.000 20.000}
# create_clock -period 4000.000 -name VIRTUAL_sd_slow_clk -waveform {0.000 2000.000}

# set_output_delay -clock [get_clocks sd_clk_out] -min -add_delay 5.000 [get_ports {sd_dat[*]}]
# set_output_delay -clock [get_clocks sd_clk_out] -max -add_delay 15.000 [get_ports {sd_dat[*]}]
# set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay 5.000 [get_ports {sd_dat[*]}]
# set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 1500.000 [get_ports {sd_dat[*]}]
# set_output_delay -clock [get_clocks sd_clk_out] -min -add_delay 5.000 [get_ports sd_cmd]
# set_output_delay -clock [get_clocks sd_clk_out] -max -add_delay 15.000 [get_ports sd_cmd]
# set_output_delay -clock [get_clocks sd_clk_out_1] -min -add_delay 5.000 [get_ports sd_cmd]
# set_output_delay -clock [get_clocks sd_clk_out_1] -max -add_delay 1500.000 [get_ports sd_cmd]
# set_input_delay -clock [get_clocks VIRTUAL_sd_fast_clk] -min -add_delay 20.000 [get_ports {sd_dat[*]}]
# set_input_delay -clock [get_clocks VIRTUAL_sd_fast_clk] -max -add_delay 35.000 [get_ports {sd_dat[*]}]
# set_input_delay -clock [get_clocks VIRTUAL_sd_slow_clk] -min -add_delay 2000.000 [get_ports {sd_dat[*]}]
# set_input_delay -clock [get_clocks VIRTUAL_sd_slow_clk] -max -add_delay 3500.000 [get_ports {sd_dat[*]}]
# set_input_delay -clock [get_clocks VIRTUAL_sd_fast_clk] -min -add_delay 20.000 [get_ports sd_cmd]
# set_input_delay -clock [get_clocks VIRTUAL_sd_fast_clk] -max -add_delay 35.000 [get_ports sd_cmd]
# set_input_delay -clock [get_clocks VIRTUAL_sd_slow_clk] -min -add_delay 2000.000 [get_ports sd_cmd]
# set_input_delay -clock [get_clocks VIRTUAL_sd_slow_clk] -max -add_delay 3500.000 [get_ports sd_cmd]
# set_clock_groups -physically_exclusive -group [get_clocks -include_generated_clocks sd_clk_out] -group [get_clocks -include_generated_clocks sd_clk_out_1]
# set_clock_groups -logically_exclusive -group [get_clocks -include_generated_clocks {VIRTUAL_sd_fast_clk sd_fast_clk}] -group [get_clocks -include_generated_clocks {sd_slow_clk VIRTUAL_sd_slow_clk}]
# set_clock_groups -asynchronous -group [get_clocks [list [get_clocks -of_objects [get_pins clk_mmcm/chipset_clk]]]] -group [get_clocks -filter { NAME =~  "*sd*" }]
## There is not USB HID in kc705
## USB HIDs For Both Mouse and Keyboard
#set_property -dict { PACKAGE_PIN AD23  IOSTANDARD LVCMOS33  PULLUP true } [get_ports { PS2_CLK }]; #IO_L12P_T1_MRCC_12 Sch=ps2_clk[0]
#set_property -dict { PACKAGE_PIN AE20  IOSTANDARD LVCMOS33  PULLUP true } [get_ports { PS2_DATA }]; #IO_25_12 Sch=ps2_data[0]


# kc705 has a quad SPI flash
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS25 } [get_ports { QSPI_CSN }]; #IO_L6P_T0_FCS_B_14 Sch=qspi_csn
set_property -dict { PACKAGE_PIN P24 IOSTANDARD LVCMOS25 } [get_ports { QSPI_D[0] }]; #IO_L1P_T0_D00_MOSI_14 Sch=qspi_d[0]
set_property -dict { PACKAGE_PIN R25 IOSTANDARD LVCMOS25 } [get_ports { QSPI_D[1] }]; #IO_L1N_T0_D01_DIN_14 Sch=qspi_d[1]
set_property -dict { PACKAGE_PIN R20 IOSTANDARD LVCMOS25 } [get_ports { QSPI_D[2] }]; #IO_L2P_T0_D02_14 Sch=qspi_d[2]
set_property -dict { PACKAGE_PIN R21 IOSTANDARD LVCMOS25 } [get_ports { QSPI_D[3] }]; #IO_L2N_T0_D03_14 Sch=qspi_d[3]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]

## JTAG
# minimize routing delay

set_max_delay -to   [get_ports { tdo } ] 20
set_max_delay -from [get_ports { tms } ] 20
set_max_delay -from [get_ports { tdi } ] 20
set_max_delay -from [get_ports { trst_n } ] 20

# reset signal
set_false_path -from [get_ports { trst_n } ]
set_false_path -from [get_pins i_ddr/u_xlnx_mig_7_ddr3_mig/u_ddr3_infrastructure/rstdiv0_sync_r1_reg_rep/C]

set_property ALLOW_COMBINATORIAL_LOOPS true [get_nets {i_ariane_peripherals/gen_gpio.rng/x0[1]}]
set_disable_timing -from I -to O \i_ariane_peripherals/gen_gpio.rng/gio[0].bufx0_inst


