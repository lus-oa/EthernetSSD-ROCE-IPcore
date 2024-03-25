
open_project hash_table_prj

open_solution "solution1"
set_part xcvu9p-flga2104-2L-e
create_clock -period 3.1 -name default

set_top hash_table_top

add_files /home/embed/Desktop/vitis-roce/hls/hash_table/hash_table.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/hash_table"


add_files -tb /home/embed/Desktop/vitis-roce/hls/hash_table/test_hash_table.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/hash_table"


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design
} elseif {$command == "ip"} {
   config_rtl -module_prefix "hash_"
   export_design -format ip_catalog -ipname "hash_table" -display_name "Hash Table (cuckoo)" -description "" -vendor "ethz.systems.fpga" -version "1.0"
} elseif {$command == "installip"} {
   file mkdir /home/embed/Desktop/vitis-roce/iprepo
   file delete -force /home/embed/Desktop/vitis-roce/iprepo/hash_table
   file copy -force /home/embed/Desktop/vitis-roce/build/hls/hash_table/hash_table_prj/solution1/impl/ip /home/embed/Desktop/vitis-roce/iprepo/hash_table/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
