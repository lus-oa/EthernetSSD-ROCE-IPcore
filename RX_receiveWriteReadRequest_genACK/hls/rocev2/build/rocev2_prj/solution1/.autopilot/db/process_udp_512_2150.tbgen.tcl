set moduleName process_udp_512_2150
set isTopModule 0
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type function
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {process_udp<512>2150}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_ip2udpFifo_V_data int 512 regular {fifo 0 volatile } {global 0}  }
	{ rx_ip2udpFifo_V_keep int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_ip2udpFifo_V_last int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_udp2shiftFifo_V_d int 512 regular {fifo 1 volatile } {global 1}  }
	{ rx_udp2shiftFifo_V_k int 64 regular {fifo 1 volatile } {global 1}  }
	{ rx_udp2shiftFifo_V_l int 1 regular {fifo 1 volatile } {global 1}  }
	{ rx_udpMetaFifo_V int 49 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_ip2udpFifo_V_data", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ip2udpFifo_V_keep", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ip2udpFifo_V_last", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_udp2shiftFifo_V_d", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_udp2shiftFifo_V_k", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_udp2shiftFifo_V_l", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_udpMetaFifo_V", "interface" : "fifo", "bitwidth" : 49, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_ip2udpFifo_V_data_dout sc_in sc_lv 512 signal 0 } 
	{ rx_ip2udpFifo_V_data_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_ip2udpFifo_V_data_read sc_out sc_logic 1 signal 0 } 
	{ rx_ip2udpFifo_V_keep_dout sc_in sc_lv 64 signal 1 } 
	{ rx_ip2udpFifo_V_keep_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_ip2udpFifo_V_keep_read sc_out sc_logic 1 signal 1 } 
	{ rx_ip2udpFifo_V_last_dout sc_in sc_lv 1 signal 2 } 
	{ rx_ip2udpFifo_V_last_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_ip2udpFifo_V_last_read sc_out sc_logic 1 signal 2 } 
	{ rx_udp2shiftFifo_V_d_din sc_out sc_lv 512 signal 3 } 
	{ rx_udp2shiftFifo_V_d_full_n sc_in sc_logic 1 signal 3 } 
	{ rx_udp2shiftFifo_V_d_write sc_out sc_logic 1 signal 3 } 
	{ rx_udp2shiftFifo_V_k_din sc_out sc_lv 64 signal 4 } 
	{ rx_udp2shiftFifo_V_k_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_udp2shiftFifo_V_k_write sc_out sc_logic 1 signal 4 } 
	{ rx_udp2shiftFifo_V_l_din sc_out sc_lv 1 signal 5 } 
	{ rx_udp2shiftFifo_V_l_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_udp2shiftFifo_V_l_write sc_out sc_logic 1 signal 5 } 
	{ rx_udpMetaFifo_V_din sc_out sc_lv 49 signal 6 } 
	{ rx_udpMetaFifo_V_full_n sc_in sc_logic 1 signal 6 } 
	{ rx_udpMetaFifo_V_write sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_ip2udpFifo_V_data_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_ip2udpFifo_V_data", "role": "dout" }} , 
 	{ "name": "rx_ip2udpFifo_V_data_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpFifo_V_data", "role": "empty_n" }} , 
 	{ "name": "rx_ip2udpFifo_V_data_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpFifo_V_data", "role": "read" }} , 
 	{ "name": "rx_ip2udpFifo_V_keep_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_ip2udpFifo_V_keep", "role": "dout" }} , 
 	{ "name": "rx_ip2udpFifo_V_keep_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpFifo_V_keep", "role": "empty_n" }} , 
 	{ "name": "rx_ip2udpFifo_V_keep_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpFifo_V_keep", "role": "read" }} , 
 	{ "name": "rx_ip2udpFifo_V_last_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpFifo_V_last", "role": "dout" }} , 
 	{ "name": "rx_ip2udpFifo_V_last_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpFifo_V_last", "role": "empty_n" }} , 
 	{ "name": "rx_ip2udpFifo_V_last_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ip2udpFifo_V_last", "role": "read" }} , 
 	{ "name": "rx_udp2shiftFifo_V_d_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_d", "role": "din" }} , 
 	{ "name": "rx_udp2shiftFifo_V_d_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_d", "role": "full_n" }} , 
 	{ "name": "rx_udp2shiftFifo_V_d_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_d", "role": "write" }} , 
 	{ "name": "rx_udp2shiftFifo_V_k_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_k", "role": "din" }} , 
 	{ "name": "rx_udp2shiftFifo_V_k_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_k", "role": "full_n" }} , 
 	{ "name": "rx_udp2shiftFifo_V_k_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_k", "role": "write" }} , 
 	{ "name": "rx_udp2shiftFifo_V_l_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_l", "role": "din" }} , 
 	{ "name": "rx_udp2shiftFifo_V_l_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_l", "role": "full_n" }} , 
 	{ "name": "rx_udp2shiftFifo_V_l_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_l", "role": "write" }} , 
 	{ "name": "rx_udpMetaFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":49, "type": "signal", "bundle":{"name": "rx_udpMetaFifo_V", "role": "din" }} , 
 	{ "name": "rx_udpMetaFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udpMetaFifo_V", "role": "full_n" }} , 
 	{ "name": "rx_udpMetaFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udpMetaFifo_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "process_udp_512_2150",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "2", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"Port" : [
			{"Name" : "rx_ip2udpFifo_V_data", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ip2udpFifo_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ip2udpFifo_V_keep", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ip2udpFifo_V_keep_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ip2udpFifo_V_last", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ip2udpFifo_V_last_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pu_header_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "pu_header_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "pu_header_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "metaWritten_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_udp2shiftFifo_V_d", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2shiftFifo_V_d_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_udp2shiftFifo_V_k", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2shiftFifo_V_k_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_udp2shiftFifo_V_l", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2shiftFifo_V_l_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_udpMetaFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udpMetaFifo_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	process_udp_512_2150 {
		rx_ip2udpFifo_V_data {Type I LastRead 0 FirstWrite -1}
		rx_ip2udpFifo_V_keep {Type I LastRead 0 FirstWrite -1}
		rx_ip2udpFifo_V_last {Type I LastRead 0 FirstWrite -1}
		pu_header_ready {Type IO LastRead -1 FirstWrite -1}
		pu_header_idx {Type IO LastRead -1 FirstWrite -1}
		pu_header_header_V {Type IO LastRead -1 FirstWrite -1}
		metaWritten_2 {Type IO LastRead -1 FirstWrite -1}
		rx_udp2shiftFifo_V_d {Type O LastRead -1 FirstWrite 2}
		rx_udp2shiftFifo_V_k {Type O LastRead -1 FirstWrite 2}
		rx_udp2shiftFifo_V_l {Type O LastRead -1 FirstWrite 2}
		rx_udpMetaFifo_V {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_ip2udpFifo_V_data { ap_fifo {  { rx_ip2udpFifo_V_data_dout fifo_data 0 512 }  { rx_ip2udpFifo_V_data_empty_n fifo_status 0 1 }  { rx_ip2udpFifo_V_data_read fifo_update 1 1 } } }
	rx_ip2udpFifo_V_keep { ap_fifo {  { rx_ip2udpFifo_V_keep_dout fifo_data 0 64 }  { rx_ip2udpFifo_V_keep_empty_n fifo_status 0 1 }  { rx_ip2udpFifo_V_keep_read fifo_update 1 1 } } }
	rx_ip2udpFifo_V_last { ap_fifo {  { rx_ip2udpFifo_V_last_dout fifo_data 0 1 }  { rx_ip2udpFifo_V_last_empty_n fifo_status 0 1 }  { rx_ip2udpFifo_V_last_read fifo_update 1 1 } } }
	rx_udp2shiftFifo_V_d { ap_fifo {  { rx_udp2shiftFifo_V_d_din fifo_data 1 512 }  { rx_udp2shiftFifo_V_d_full_n fifo_status 0 1 }  { rx_udp2shiftFifo_V_d_write fifo_update 1 1 } } }
	rx_udp2shiftFifo_V_k { ap_fifo {  { rx_udp2shiftFifo_V_k_din fifo_data 1 64 }  { rx_udp2shiftFifo_V_k_full_n fifo_status 0 1 }  { rx_udp2shiftFifo_V_k_write fifo_update 1 1 } } }
	rx_udp2shiftFifo_V_l { ap_fifo {  { rx_udp2shiftFifo_V_l_din fifo_data 1 1 }  { rx_udp2shiftFifo_V_l_full_n fifo_status 0 1 }  { rx_udp2shiftFifo_V_l_write fifo_update 1 1 } } }
	rx_udpMetaFifo_V { ap_fifo {  { rx_udpMetaFifo_V_din fifo_data 1 49 }  { rx_udpMetaFifo_V_full_n fifo_status 0 1 }  { rx_udpMetaFifo_V_write fifo_update 1 1 } } }
}