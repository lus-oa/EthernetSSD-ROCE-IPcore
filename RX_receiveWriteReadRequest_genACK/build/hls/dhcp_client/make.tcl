
open_project dhcp_client_prj

open_solution "solution1"
set_part xcvu9p-flga2104-2L-e
create_clock -period 3.1 -name default

set_top dhcp_client

add_files /home/embed/Desktop/vitis-roce/hls/dhcp_client/dhcp_client.cpp -cflags "-I/home/embed/Desktop/vitis-roce/build/hls/dhcp_client"


#add_files -tb test_dhcp_client.cpp


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design
} elseif {$command == "ip"} {
   config_rtl -module_prefix "dhcp_"
   export_design -format ip_catalog -ipname "dhcp_client" -display_name "DHCP Client" -description "DHCP Client to be used with the Xilinx Labs TCP & UDP offload engines." -vendor "xilinx.labs" -version "1.05"
} elseif {$command == "installip"} {
   file mkdir /home/embed/Desktop/vitis-roce/iprepo
   file delete -force /home/embed/Desktop/vitis-roce/iprepo/dhcp_client
   file copy -force /home/embed/Desktop/vitis-roce/build/hls/dhcp_client/dhcp_client_prj/solution1/impl/ip /home/embed/Desktop/vitis-roce/iprepo/dhcp_client/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
