
open_project toe_prj

open_solution "solution1"
set_part xcvu9p-flga2104-2L-e
create_clock -period 3.1 -name default

set_top toe_top

add_files /home/embed/Desktop/vitis-roce/hls/toe/../axi_utils.cpp
add_files /home/embed/Desktop/vitis-roce/hls/toe/ack_delay/ack_delay.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/close_timer/close_timer.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/event_engine/event_engine.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/port_table/port_table.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/probe_timer/probe_timer.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/retransmit_timer/retransmit_timer.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/rx_app_if/rx_app_if.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/rx_app_stream_if/rx_app_stream_if.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/rx_engine/rx_engine.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/rx_sar_table/rx_sar_table.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/session_lookup_controller/session_lookup_controller.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/state_table/state_table.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/tx_app_if/tx_app_if.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/tx_app_stream_if/tx_app_stream_if.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/tx_engine/tx_engine.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/tx_sar_table/tx_sar_table.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/tx_app_interface/tx_app_interface.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"
add_files /home/embed/Desktop/vitis-roce/hls/toe/toe.cpp -cflags "-std=c++11 -I/home/embed/Desktop/vitis-roce/build/hls/toe"


add_files -tb /home/embed/Desktop/vitis-roce/hls/toe/toe_tb.cpp

config_rtl -disable_start_propagation


#Check which command
set command [lindex $argv 2]

if {$command == "synthesis"} {
   csynth_design
} elseif {$command == "csim"} {
   csim_design -clean -argv {0 /home/embed/Desktop/vitis-roce/hls/toe/testVectors/io_fin_5.dat /home/embed/Desktop/vitis-roce/hls/toe/testVectors/rxOutput.dat /home/embed/Desktop/vitis-roce/hls/toe/testVectors/txOutput.dat /home/embed/Desktop/vitis-roce/hls/toe/testVectors/rx_io_fin_5.gold}
#   csim_design -clean -argv {0 /home/embed/Desktop/vitis-roce/hls/toe/testVectors/mysyn2.dat /home/embed/Desktop/vitis-roce/hls/toe/testVectors/rxOutput.dat /home/embed/Desktop/vitis-roce/hls/toe/testVectors/txOutput.dat /home/embed/Desktop/vitis-roce/hls/toe/testVectors/rx_io_fin_5.gold}
} elseif {$command == "ip"} {
   export_design -format ip_catalog -ipname "toe" -display_name "10G TCP Offload Engine" -description "TCP Offload Engine supporting 10Gbps line rate, up to 10K concurrent sessions." -vendor "ethz.systems" -version "1.6"
} elseif {$command == "installip"} {
   file mkdir /home/embed/Desktop/vitis-roce/iprepo
   file delete -force /home/embed/Desktop/vitis-roce/iprepo/toe
   file copy -force /home/embed/Desktop/vitis-roce/build/hls/toe/toe_prj/solution1/impl/ip /home/embed/Desktop/vitis-roce/iprepo/toe/
} else {
   puts "No valid command specified. Use vivado_hls -f make.tcl <synthesis|csim|ip> ."
}


exit
