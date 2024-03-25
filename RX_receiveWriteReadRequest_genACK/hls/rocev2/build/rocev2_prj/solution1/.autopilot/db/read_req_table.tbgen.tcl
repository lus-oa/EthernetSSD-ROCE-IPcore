set moduleName read_req_table
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
set C_modelName {read_req_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_readReqTable_upd_s_0 int 40 regular {fifo 0 volatile } {global 0}  }
	{ rx_readReqTable_upd_1 int 41 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_readReqTable_upd_s_0", "interface" : "fifo", "bitwidth" : 40, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqTable_upd_1", "interface" : "fifo", "bitwidth" : 41, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 13
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tx_readReqTable_upd_s_0_dout sc_in sc_lv 40 signal 0 } 
	{ tx_readReqTable_upd_s_0_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_readReqTable_upd_s_0_read sc_out sc_logic 1 signal 0 } 
	{ rx_readReqTable_upd_1_dout sc_in sc_lv 41 signal 1 } 
	{ rx_readReqTable_upd_1_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_readReqTable_upd_1_read sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_readReqTable_upd_s_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "tx_readReqTable_upd_s_0", "role": "dout" }} , 
 	{ "name": "tx_readReqTable_upd_s_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqTable_upd_s_0", "role": "empty_n" }} , 
 	{ "name": "tx_readReqTable_upd_s_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqTable_upd_s_0", "role": "read" }} , 
 	{ "name": "rx_readReqTable_upd_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":41, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_1", "role": "dout" }} , 
 	{ "name": "rx_readReqTable_upd_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_1", "role": "empty_n" }} , 
 	{ "name": "rx_readReqTable_upd_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_1", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "read_req_table",
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
			{"Name" : "tx_readReqTable_upd_s_0", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqTable_upd_s_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "req_table_max_fwd_re", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "rx_readReqTable_upd_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqTable_upd_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "req_table_oldest_out", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.req_table_max_fwd_re_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.req_table_oldest_out_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	read_req_table {
		tx_readReqTable_upd_s_0 {Type I LastRead 0 FirstWrite -1}
		req_table_max_fwd_re {Type O LastRead -1 FirstWrite -1}
		rx_readReqTable_upd_1 {Type I LastRead 1 FirstWrite -1}
		req_table_oldest_out {Type O LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_readReqTable_upd_s_0 { ap_fifo {  { tx_readReqTable_upd_s_0_dout fifo_data 0 40 }  { tx_readReqTable_upd_s_0_empty_n fifo_status 0 1 }  { tx_readReqTable_upd_s_0_read fifo_update 1 1 } } }
	rx_readReqTable_upd_1 { ap_fifo {  { rx_readReqTable_upd_1_dout fifo_data 0 41 }  { rx_readReqTable_upd_1_empty_n fifo_status 0 1 }  { rx_readReqTable_upd_1_read fifo_update 1 1 } } }
}
