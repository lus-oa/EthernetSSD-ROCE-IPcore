set moduleName udp_rshiftWordByOcte
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
set C_modelName {udp_rshiftWordByOcte}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_udp2shiftFifo_V_d int 512 regular {fifo 0 volatile } {global 0}  }
	{ rx_udp2shiftFifo_V_k int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_udp2shiftFifo_V_l int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_udp2ibFifo_V_data int 512 regular {fifo 1 volatile } {global 1}  }
	{ rx_udp2ibFifo_V_keep int 64 regular {fifo 1 volatile } {global 1}  }
	{ rx_udp2ibFifo_V_last int 1 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_udp2shiftFifo_V_d", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_udp2shiftFifo_V_k", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_udp2shiftFifo_V_l", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_udp2ibFifo_V_data", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_udp2ibFifo_V_keep", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_udp2ibFifo_V_last", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_udp2shiftFifo_V_d_dout sc_in sc_lv 512 signal 0 } 
	{ rx_udp2shiftFifo_V_d_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_udp2shiftFifo_V_d_read sc_out sc_logic 1 signal 0 } 
	{ rx_udp2shiftFifo_V_k_dout sc_in sc_lv 64 signal 1 } 
	{ rx_udp2shiftFifo_V_k_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_udp2shiftFifo_V_k_read sc_out sc_logic 1 signal 1 } 
	{ rx_udp2shiftFifo_V_l_dout sc_in sc_lv 1 signal 2 } 
	{ rx_udp2shiftFifo_V_l_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_udp2shiftFifo_V_l_read sc_out sc_logic 1 signal 2 } 
	{ rx_udp2ibFifo_V_data_din sc_out sc_lv 512 signal 3 } 
	{ rx_udp2ibFifo_V_data_full_n sc_in sc_logic 1 signal 3 } 
	{ rx_udp2ibFifo_V_data_write sc_out sc_logic 1 signal 3 } 
	{ rx_udp2ibFifo_V_keep_din sc_out sc_lv 64 signal 4 } 
	{ rx_udp2ibFifo_V_keep_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_udp2ibFifo_V_keep_write sc_out sc_logic 1 signal 4 } 
	{ rx_udp2ibFifo_V_last_din sc_out sc_lv 1 signal 5 } 
	{ rx_udp2ibFifo_V_last_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_udp2ibFifo_V_last_write sc_out sc_logic 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_udp2shiftFifo_V_d_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_d", "role": "dout" }} , 
 	{ "name": "rx_udp2shiftFifo_V_d_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_d", "role": "empty_n" }} , 
 	{ "name": "rx_udp2shiftFifo_V_d_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_d", "role": "read" }} , 
 	{ "name": "rx_udp2shiftFifo_V_k_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_k", "role": "dout" }} , 
 	{ "name": "rx_udp2shiftFifo_V_k_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_k", "role": "empty_n" }} , 
 	{ "name": "rx_udp2shiftFifo_V_k_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_k", "role": "read" }} , 
 	{ "name": "rx_udp2shiftFifo_V_l_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_l", "role": "dout" }} , 
 	{ "name": "rx_udp2shiftFifo_V_l_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_l", "role": "empty_n" }} , 
 	{ "name": "rx_udp2shiftFifo_V_l_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2shiftFifo_V_l", "role": "read" }} , 
 	{ "name": "rx_udp2ibFifo_V_data_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_udp2ibFifo_V_data", "role": "din" }} , 
 	{ "name": "rx_udp2ibFifo_V_data_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2ibFifo_V_data", "role": "full_n" }} , 
 	{ "name": "rx_udp2ibFifo_V_data_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2ibFifo_V_data", "role": "write" }} , 
 	{ "name": "rx_udp2ibFifo_V_keep_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_udp2ibFifo_V_keep", "role": "din" }} , 
 	{ "name": "rx_udp2ibFifo_V_keep_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2ibFifo_V_keep", "role": "full_n" }} , 
 	{ "name": "rx_udp2ibFifo_V_keep_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2ibFifo_V_keep", "role": "write" }} , 
 	{ "name": "rx_udp2ibFifo_V_last_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2ibFifo_V_last", "role": "din" }} , 
 	{ "name": "rx_udp2ibFifo_V_last_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2ibFifo_V_last", "role": "full_n" }} , 
 	{ "name": "rx_udp2ibFifo_V_last_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_udp2ibFifo_V_last", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "udp_rshiftWordByOcte",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"Port" : [
			{"Name" : "fsmState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_udp2shiftFifo_V_d", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2shiftFifo_V_d_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_udp2shiftFifo_V_k", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2shiftFifo_V_k_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_udp2shiftFifo_V_l", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2shiftFifo_V_l_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rs_firstWord", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_udp2ibFifo_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2ibFifo_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_udp2ibFifo_V_keep", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2ibFifo_V_keep_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_udp2ibFifo_V_last", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_udp2ibFifo_V_last_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	udp_rshiftWordByOcte {
		fsmState {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_14 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_15 {Type IO LastRead -1 FirstWrite -1}
		rx_udp2shiftFifo_V_d {Type I LastRead 0 FirstWrite -1}
		rx_udp2shiftFifo_V_k {Type I LastRead 0 FirstWrite -1}
		rx_udp2shiftFifo_V_l {Type I LastRead 0 FirstWrite -1}
		rs_firstWord {Type IO LastRead -1 FirstWrite -1}
		rx_udp2ibFifo_V_data {Type O LastRead -1 FirstWrite 1}
		rx_udp2ibFifo_V_keep {Type O LastRead -1 FirstWrite 1}
		rx_udp2ibFifo_V_last {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_udp2shiftFifo_V_d { ap_fifo {  { rx_udp2shiftFifo_V_d_dout fifo_data 0 512 }  { rx_udp2shiftFifo_V_d_empty_n fifo_status 0 1 }  { rx_udp2shiftFifo_V_d_read fifo_update 1 1 } } }
	rx_udp2shiftFifo_V_k { ap_fifo {  { rx_udp2shiftFifo_V_k_dout fifo_data 0 64 }  { rx_udp2shiftFifo_V_k_empty_n fifo_status 0 1 }  { rx_udp2shiftFifo_V_k_read fifo_update 1 1 } } }
	rx_udp2shiftFifo_V_l { ap_fifo {  { rx_udp2shiftFifo_V_l_dout fifo_data 0 1 }  { rx_udp2shiftFifo_V_l_empty_n fifo_status 0 1 }  { rx_udp2shiftFifo_V_l_read fifo_update 1 1 } } }
	rx_udp2ibFifo_V_data { ap_fifo {  { rx_udp2ibFifo_V_data_din fifo_data 1 512 }  { rx_udp2ibFifo_V_data_full_n fifo_status 0 1 }  { rx_udp2ibFifo_V_data_write fifo_update 1 1 } } }
	rx_udp2ibFifo_V_keep { ap_fifo {  { rx_udp2ibFifo_V_keep_din fifo_data 1 64 }  { rx_udp2ibFifo_V_keep_full_n fifo_status 0 1 }  { rx_udp2ibFifo_V_keep_write fifo_update 1 1 } } }
	rx_udp2ibFifo_V_last { ap_fifo {  { rx_udp2ibFifo_V_last_din fifo_data 1 1 }  { rx_udp2ibFifo_V_last_full_n fifo_status 0 1 }  { rx_udp2ibFifo_V_last_write fifo_update 1 1 } } }
}
