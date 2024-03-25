
open_project udp_prj

open_solution "solution1"
set_part xcvu9p-flga2104-2L-e
create_clock -period 3.1 -name default

set_top udp_top

#add_files /home/embed/Desktop/vitis-roce/hls/udp/../packet.hpp
#add_files /home/embed/Desktop/vitis-roce/hls/udp/udp.hpp
add_files /home/embed/Desktop/vitis-roce/hls/udp/udp.cpp -cflags "-I/home/embed/Desktop/vitis-roce/build/hls/udp"


#add_files -tb test_udp.cpp


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design
} elseif {$command == "ip"} {
   config_rtl -module_prefix "udp_"
   export_design -format ip_catalog -ipname "udp" -display_name "UDP" -description "" -vendor "ethz.systems.fpga" -version "0.4"
} elseif {$command == "installip"} {
   file mkdir /home/embed/Desktop/vitis-roce/iprepo
   file delete -force /home/embed/Desktop/vitis-roce/iprepo/udp
   file copy -force /home/embed/Desktop/vitis-roce/build/hls/udp/udp_prj/solution1/impl/ip /home/embed/Desktop/vitis-roce/iprepo/udp/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
