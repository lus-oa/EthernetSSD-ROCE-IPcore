set moduleName compute_crc32
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
set C_modelName {compute_crc32}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_maskedDataFifo_V_1 int 512 regular {fifo 0 volatile } {global 0}  }
	{ tx_maskedDataFifo_V_2 int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_maskedDataFifo_V_s int 1 regular {fifo 0 volatile } {global 0}  }
	{ crcFifo1_V_V int 32 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_maskedDataFifo_V_1", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_maskedDataFifo_V_2", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_maskedDataFifo_V_s", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "crcFifo1_V_V", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tx_maskedDataFifo_V_1_dout sc_in sc_lv 512 signal 0 } 
	{ tx_maskedDataFifo_V_1_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_maskedDataFifo_V_1_read sc_out sc_logic 1 signal 0 } 
	{ tx_maskedDataFifo_V_2_dout sc_in sc_lv 64 signal 1 } 
	{ tx_maskedDataFifo_V_2_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_maskedDataFifo_V_2_read sc_out sc_logic 1 signal 1 } 
	{ tx_maskedDataFifo_V_s_dout sc_in sc_lv 1 signal 2 } 
	{ tx_maskedDataFifo_V_s_empty_n sc_in sc_logic 1 signal 2 } 
	{ tx_maskedDataFifo_V_s_read sc_out sc_logic 1 signal 2 } 
	{ crcFifo1_V_V_din sc_out sc_lv 32 signal 3 } 
	{ crcFifo1_V_V_full_n sc_in sc_logic 1 signal 3 } 
	{ crcFifo1_V_V_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_maskedDataFifo_V_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_maskedDataFifo_V_1", "role": "dout" }} , 
 	{ "name": "tx_maskedDataFifo_V_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_maskedDataFifo_V_1", "role": "empty_n" }} , 
 	{ "name": "tx_maskedDataFifo_V_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_maskedDataFifo_V_1", "role": "read" }} , 
 	{ "name": "tx_maskedDataFifo_V_2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_maskedDataFifo_V_2", "role": "dout" }} , 
 	{ "name": "tx_maskedDataFifo_V_2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_maskedDataFifo_V_2", "role": "empty_n" }} , 
 	{ "name": "tx_maskedDataFifo_V_2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_maskedDataFifo_V_2", "role": "read" }} , 
 	{ "name": "tx_maskedDataFifo_V_s_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_maskedDataFifo_V_s", "role": "dout" }} , 
 	{ "name": "tx_maskedDataFifo_V_s_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_maskedDataFifo_V_s", "role": "empty_n" }} , 
 	{ "name": "tx_maskedDataFifo_V_s_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_maskedDataFifo_V_s", "role": "read" }} , 
 	{ "name": "crcFifo1_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "crcFifo1_V_V", "role": "din" }} , 
 	{ "name": "crcFifo1_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crcFifo1_V_V", "role": "full_n" }} , 
 	{ "name": "crcFifo1_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "crcFifo1_V_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "compute_crc32",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "6",
		"VariableLatency" : "0", "ExactLatency" : "6", "EstimateLatencyMin" : "6", "EstimateLatencyMax" : "6",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"Port" : [
			{"Name" : "crcState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "crc", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "currWord_keep_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "currWord_data_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "currWord_last_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_maskedDataFifo_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_maskedDataFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_maskedDataFifo_V_2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_maskedDataFifo_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_maskedDataFifo_V_s", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_maskedDataFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "crcFifo1_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "crcFifo1_V_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	compute_crc32 {
		crcState {Type IO LastRead -1 FirstWrite -1}
		crc {Type IO LastRead -1 FirstWrite -1}
		currWord_keep_V {Type IO LastRead -1 FirstWrite -1}
		currWord_data_V {Type IO LastRead -1 FirstWrite -1}
		currWord_last_V {Type IO LastRead -1 FirstWrite -1}
		tx_maskedDataFifo_V_1 {Type I LastRead 1 FirstWrite -1}
		tx_maskedDataFifo_V_2 {Type I LastRead 1 FirstWrite -1}
		tx_maskedDataFifo_V_s {Type I LastRead 1 FirstWrite -1}
		crcFifo1_V_V {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "6", "Max" : "6"}
	, {"Name" : "Interval", "Min" : "6", "Max" : "6"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_maskedDataFifo_V_1 { ap_fifo {  { tx_maskedDataFifo_V_1_dout fifo_data 0 512 }  { tx_maskedDataFifo_V_1_empty_n fifo_status 0 1 }  { tx_maskedDataFifo_V_1_read fifo_update 1 1 } } }
	tx_maskedDataFifo_V_2 { ap_fifo {  { tx_maskedDataFifo_V_2_dout fifo_data 0 64 }  { tx_maskedDataFifo_V_2_empty_n fifo_status 0 1 }  { tx_maskedDataFifo_V_2_read fifo_update 1 1 } } }
	tx_maskedDataFifo_V_s { ap_fifo {  { tx_maskedDataFifo_V_s_dout fifo_data 0 1 }  { tx_maskedDataFifo_V_s_empty_n fifo_status 0 1 }  { tx_maskedDataFifo_V_s_read fifo_update 1 1 } } }
	crcFifo1_V_V { ap_fifo {  { crcFifo1_V_V_din fifo_data 1 32 }  { crcFifo1_V_V_full_n fifo_status 0 1 }  { crcFifo1_V_V_write fifo_update 1 1 } } }
}
