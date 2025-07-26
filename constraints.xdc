# Clock and Reset
set_property PACKAGE_PIN F14 [get_ports clk]
set_property PACKAGE_PIN J2 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports reset]
create_clock -period 10.000 -name sys_clk -waveform {0 5} [get_ports clk]

# OLED SPI Pins (example mapping, update for your board)
set_property PACKAGE_PIN R4 [get_ports cs]
set_property PACKAGE_PIN T3 [get_ports sdin]
set_property PACKAGE_PIN N4 [get_ports sclk]
set_property PACKAGE_PIN L5 [get_ports d_cn]
set_property PACKAGE_PIN M4 [get_ports resn]
set_property PACKAGE_PIN K4 [get_ports vccen]
set_property PACKAGE_PIN L4 [get_ports pmoden]

set_property IOSTANDARD LVCMOS33 [get_ports cs]
set_property IOSTANDARD LVCMOS33 [get_ports sdin]
set_property IOSTANDARD LVCMOS33 [get_ports sclk]
set_property IOSTANDARD LVCMOS33 [get_ports d_cn]
set_property IOSTANDARD LVCMOS33 [get_ports resn]
set_property IOSTANDARD LVCMOS33 [get_ports vccen]
set_property IOSTANDARD LVCMOS33 [get_ports pmoden]
