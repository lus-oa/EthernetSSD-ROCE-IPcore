set moduleName handle_read_requests
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
set C_modelName {handle_read_requests}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_readRequestFifo_V int 129 regular {fifo 0 volatile } {global 0}  }
	{ rx_remoteMemCmd_V int 113 regular {fifo 1 volatile } {global 1}  }
	{ rx_readEvenFifo_V int 135 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_readRequestFifo_V", "interface" : "fifo", "bitwidth" : 129, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_remoteMemCmd_V", "interface" : "fifo", "bitwidth" : 113, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readEvenFifo_V", "interface" : "fifo", "bitwidth" : 135, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_readRequestFifo_V_dout sc_in sc_lv 129 signal 0 } 
	{ rx_readRequestFifo_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_readRequestFifo_V_read sc_out sc_logic 1 signal 0 } 
	{ rx_remoteMemCmd_V_din sc_out sc_lv 113 signal 1 } 
	{ rx_remoteMemCmd_V_full_n sc_in sc_logic 1 signal 1 } 
	{ rx_remoteMemCmd_V_write sc_out sc_logic 1 signal 1 } 
	{ rx_readEvenFifo_V_din sc_out sc_lv 135 signal 2 } 
	{ rx_readEvenFifo_V_full_n sc_in sc_logic 1 signal 2 } 
	{ rx_readEvenFifo_V_write sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_readRequestFifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "rx_readRequestFifo_V", "role": "dout" }} , 
 	{ "name": "rx_readRequestFifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readRequestFifo_V", "role": "empty_n" }} , 
 	{ "name": "rx_readRequestFifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readRequestFifo_V", "role": "read" }} , 
 	{ "name": "rx_remoteMemCmd_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":113, "type": "signal", "bundle":{"name": "rx_remoteMemCmd_V", "role": "din" }} , 
 	{ "name": "rx_remoteMemCmd_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_remoteMemCmd_V", "role": "full_n" }} , 
 	{ "name": "rx_remoteMemCmd_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_remoteMemCmd_V", "role": "write" }} , 
 	{ "name": "rx_readEvenFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":135, "type": "signal", "bundle":{"name": "rx_readEvenFifo_V", "role": "din" }} , 
 	{ "name": "rx_readEvenFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readEvenFifo_V", "role": "full_n" }} , 
 	{ "name": "rx_readEvenFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readEvenFifo_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "handle_read_requests",
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
			{"Name" : "hrr_fsmState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "request_vaddr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "request_dma_length_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_readRequestFifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readRequestFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "request_qpn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "request_psn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_remoteMemCmd_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_remoteMemCmd_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readEvenFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readEvenFifo_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	handle_read_requests {
		hrr_fsmState {Type IO LastRead -1 FirstWrite -1}
		request_vaddr_V {Type IO LastRead -1 FirstWrite -1}
		request_dma_length_V {Type IO LastRead -1 FirstWrite -1}
		rx_readRequestFifo_V {Type I LastRead 0 FirstWrite -1}
		request_qpn_V {Type IO LastRead -1 FirstWrite -1}
		request_psn_V {Type IO LastRead -1 FirstWrite -1}
		rx_remoteMemCmd_V {Type O LastRead -1 FirstWrite 1}
		rx_readEvenFifo_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_readRequestFifo_V { ap_fifo {  { rx_readRequestFifo_V_dout fifo_data 0 129 }  { rx_readRequestFifo_V_empty_n fifo_status 0 1 }  { rx_readRequestFifo_V_read fifo_update 1 1 } } }
	rx_remoteMemCmd_V { ap_fifo {  { rx_remoteMemCmd_V_din fifo_data 1 113 }  { rx_remoteMemCmd_V_full_n fifo_status 0 1 }  { rx_remoteMemCmd_V_write fifo_update 1 1 } } }
	rx_readEvenFifo_V { ap_fifo {  { rx_readEvenFifo_V_din fifo_data 1 135 }  { rx_readEvenFifo_V_full_n fifo_status 0 1 }  { rx_readEvenFifo_V_write fifo_update 1 1 } } }
}
