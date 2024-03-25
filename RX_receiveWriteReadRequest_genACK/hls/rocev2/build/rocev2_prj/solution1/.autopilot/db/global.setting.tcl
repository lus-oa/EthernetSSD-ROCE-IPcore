
set TopModule "rocev2_top"
set ClockPeriod 8
set ClockList ap_clk
set HasVivadoClockPeriod 0
set CombLogicFlag 0
set PipelineFlag 1
set DataflowTaskPipelineFlag 1
set TrivialPipelineFlag 0
set noPortSwitchingFlag 0
set FloatingPointFlag 0
set FftOrFirFlag 0
set NbRWValue 1
set intNbAccess 1
set NewDSPMapping 1
set HasDSPModule 0
set ResetLevelFlag 0
set ResetStyle control
set ResetSyncFlag 1
set ResetRegisterFlag 0
set ResetVariableFlag 1
set FsmEncStyle onehot
set MaxFanout 0
set RtlPrefix {}
set ExtraCCFlags {}
set ExtraCLdFlags {}
set SynCheckOptions {}
set PresynOptions {}
set PreprocOptions {}
set SchedOptions {}
set BindOptions {}
set RtlGenOptions {}
set RtlWriterOptions {}
set CbcGenFlag {}
set CasGenFlag {}
set CasMonitorFlag {}
set AutoSimOptions {}
set ExportMCPathFlag 0
set SCTraceFileName mytrace
set SCTraceFileFormat vcd
set SCTraceOption all
set TargetInfo xczu7eg:-ffvc1156:-2-i
set SourceFiles {sc {} c {/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/rocev2.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ib_transport_protocol/msn_table.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ib_transport_protocol/conn_table.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ib_transport_protocol/state_table.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ib_transport_protocol/retransmitter/retransmitter.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ib_transport_protocol/transport_timer.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ib_transport_protocol/read_req_table.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ib_transport_protocol/ib_transport_protocol.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ib_transport_protocol/ib_utils.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../udp/udp.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ipv6/ipv6.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ipv4/ipv4.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../ipv4/ipv4_utils.cpp /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/../axi_utils.cpp}}
set SourceFlags {sc {} c {-I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build -I/home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build {}}}
set DirectiveFile /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/build/rocev2_prj/solution1/solution1.directive
set TBFiles {verilog /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/test_rocev2.cpp bc /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/test_rocev2.cpp vhdl /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/test_rocev2.cpp sc /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/test_rocev2.cpp cas /home/embed/Desktop/xkjiang/Github_Version/EthernetSSD-System-main/RX_receiveWriteReadRequest_genACK/hls/rocev2/test_rocev2.cpp c {}}
set SpecLanguage C
set TVInFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TVOutFiles {bc {} c {} sc {} cas {} vhdl {} verilog {}}
set TBTops {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set TBInstNames {verilog {} bc {} vhdl {} sc {} cas {} c {}}
set XDCFiles {}
set ExtraGlobalOptions {"area_timing" 1 "clock_gate" 1 "impl_flow" map "power_gate" 0}
set TBTVFileNotFound {}
set AppFile ../vivado_hls.app
set ApsFile solution1.aps
set AvePath ../..
set DefaultPlatform DefaultPlatform
set multiClockList {}
set SCPortClockMap {}
set intNbAccess 1
set PlatformFiles {{DefaultPlatform {xilinx/zynquplus/zynquplus xilinx/zynquplus/zynquplus_fpv7}}}
set HPFPO 0
