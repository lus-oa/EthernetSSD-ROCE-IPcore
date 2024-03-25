
open_project icmp_server_prj

open_solution "solution1"
set_part xcvu9p-flga2104-2L-e
create_clock -period 3.1 -name default

set_top icmp_server

add_files /home/embed/Desktop/vitis-roce/hls/icmp_server/icmp_server.cpp -cflags "-I/home/embed/Desktop/vitis-roce/build/hls/icmp_server"


add_files -tb test_icmp_server.cpp


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design
} elseif {$command == "ip"} {
   config_rtl -module_prefix "icmp_"
   export_design -format ip_catalog -ipname "icmp_server" -display_name "ICMP Server" -vendor "xilinx.labs" -version "1.67"
} elseif {$command == "installip"} {
   file mkdir /home/embed/Desktop/vitis-roce/iprepo
   file delete -force /home/embed/Desktop/vitis-roce/iprepo/icmp_server
   file copy -force /home/embed/Desktop/vitis-roce/build/hls/icmp_server/icmp_server_prj/solution1/impl/ip /home/embed/Desktop/vitis-roce/iprepo/icmp_server/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
