
open_project ipv4_prj

open_solution "solution1"
set_part xcvu9p-flga2104-2L-e
create_clock -period 3.1 -name default

set_top ipv4_top

#add_files /home/embed/Desktop/vitis-roce/../packet.hpp
#add_files /home/embed/Desktop/vitis-roce/ipv4.hpp
add_files /home/embed/Desktop/vitis-roce/hls/ipv4/ipv4.cpp -cflags "-I/home/embed/Desktop/vitis-roce/build/hls/ipv4"


#add_files -tb /home/embed/Desktop/vitis-roce/hls/ipv4/test_ipv4.cpp


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design
} elseif {$command == "ip"} {
   config_rtl -module_prefix "ipv4_"
   export_design -format ip_catalog -ipname "ipv4" -display_name "IPv4" -description "" -vendor "ethz.systems.fpga" -version "0.1"
} elseif {$command == "installip"} {
   file mkdir /home/embed/Desktop/vitis-roce/iprepo
   file delete -force /home/embed/Desktop/vitis-roce/iprepo/ipv4
   file copy -force /home/embed/Desktop/vitis-roce/build/hls/ipv4/ipv4_prj/solution1/impl/ip /home/embed/Desktop/vitis-roce/iprepo/ipv4/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
