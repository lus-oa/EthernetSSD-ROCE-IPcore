set moduleName rshiftWordByOctet
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
set C_modelName {rshiftWordByOctet}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_exh2rethShiftFifo_8 int 512 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2rethShiftFifo_6 int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2rethShiftFifo_7 int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2rethShiftFifo_4 int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_rethSift2mergerFi_8 int 512 regular {fifo 1 volatile } {global 1}  }
	{ rx_rethSift2mergerFi_6 int 64 regular {fifo 1 volatile } {global 1}  }
	{ rx_rethSift2mergerFi_7 int 1 regular {fifo 1 volatile } {global 1}  }
	{ rx_rethSift2mergerFi_4 int 1 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_exh2rethShiftFifo_8", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2rethShiftFifo_6", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2rethShiftFifo_7", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2rethShiftFifo_4", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_rethSift2mergerFi_8", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_rethSift2mergerFi_6", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_rethSift2mergerFi_7", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_rethSift2mergerFi_4", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_exh2rethShiftFifo_8_dout sc_in sc_lv 512 signal 0 } 
	{ rx_exh2rethShiftFifo_8_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_exh2rethShiftFifo_8_read sc_out sc_logic 1 signal 0 } 
	{ rx_exh2rethShiftFifo_6_dout sc_in sc_lv 64 signal 1 } 
	{ rx_exh2rethShiftFifo_6_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_exh2rethShiftFifo_6_read sc_out sc_logic 1 signal 1 } 
	{ rx_exh2rethShiftFifo_7_dout sc_in sc_lv 1 signal 2 } 
	{ rx_exh2rethShiftFifo_7_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_exh2rethShiftFifo_7_read sc_out sc_logic 1 signal 2 } 
	{ rx_exh2rethShiftFifo_4_dout sc_in sc_lv 1 signal 3 } 
	{ rx_exh2rethShiftFifo_4_empty_n sc_in sc_logic 1 signal 3 } 
	{ rx_exh2rethShiftFifo_4_read sc_out sc_logic 1 signal 3 } 
	{ rx_rethSift2mergerFi_8_din sc_out sc_lv 512 signal 4 } 
	{ rx_rethSift2mergerFi_8_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_rethSift2mergerFi_8_write sc_out sc_logic 1 signal 4 } 
	{ rx_rethSift2mergerFi_6_din sc_out sc_lv 64 signal 5 } 
	{ rx_rethSift2mergerFi_6_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_rethSift2mergerFi_6_write sc_out sc_logic 1 signal 5 } 
	{ rx_rethSift2mergerFi_7_din sc_out sc_lv 1 signal 6 } 
	{ rx_rethSift2mergerFi_7_full_n sc_in sc_logic 1 signal 6 } 
	{ rx_rethSift2mergerFi_7_write sc_out sc_logic 1 signal 6 } 
	{ rx_rethSift2mergerFi_4_din sc_out sc_lv 1 signal 7 } 
	{ rx_rethSift2mergerFi_4_full_n sc_in sc_logic 1 signal 7 } 
	{ rx_rethSift2mergerFi_4_write sc_out sc_logic 1 signal 7 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_exh2rethShiftFifo_8_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_8", "role": "dout" }} , 
 	{ "name": "rx_exh2rethShiftFifo_8_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_8", "role": "empty_n" }} , 
 	{ "name": "rx_exh2rethShiftFifo_8_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_8", "role": "read" }} , 
 	{ "name": "rx_exh2rethShiftFifo_6_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_6", "role": "dout" }} , 
 	{ "name": "rx_exh2rethShiftFifo_6_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_6", "role": "empty_n" }} , 
 	{ "name": "rx_exh2rethShiftFifo_6_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_6", "role": "read" }} , 
 	{ "name": "rx_exh2rethShiftFifo_7_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_7", "role": "dout" }} , 
 	{ "name": "rx_exh2rethShiftFifo_7_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_7", "role": "empty_n" }} , 
 	{ "name": "rx_exh2rethShiftFifo_7_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_7", "role": "read" }} , 
 	{ "name": "rx_exh2rethShiftFifo_4_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_4", "role": "dout" }} , 
 	{ "name": "rx_exh2rethShiftFifo_4_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_4", "role": "empty_n" }} , 
 	{ "name": "rx_exh2rethShiftFifo_4_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2rethShiftFifo_4", "role": "read" }} , 
 	{ "name": "rx_rethSift2mergerFi_8_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_8", "role": "din" }} , 
 	{ "name": "rx_rethSift2mergerFi_8_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_8", "role": "full_n" }} , 
 	{ "name": "rx_rethSift2mergerFi_8_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_8", "role": "write" }} , 
 	{ "name": "rx_rethSift2mergerFi_6_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_6", "role": "din" }} , 
 	{ "name": "rx_rethSift2mergerFi_6_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_6", "role": "full_n" }} , 
 	{ "name": "rx_rethSift2mergerFi_6_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_6", "role": "write" }} , 
 	{ "name": "rx_rethSift2mergerFi_7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_7", "role": "din" }} , 
 	{ "name": "rx_rethSift2mergerFi_7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_7", "role": "full_n" }} , 
 	{ "name": "rx_rethSift2mergerFi_7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_7", "role": "write" }} , 
 	{ "name": "rx_rethSift2mergerFi_4_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_4", "role": "din" }} , 
 	{ "name": "rx_rethSift2mergerFi_4_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_4", "role": "full_n" }} , 
 	{ "name": "rx_rethSift2mergerFi_4_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_rethSift2mergerFi_4", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "rshiftWordByOctet",
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
			{"Name" : "fsmState_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_data_V_19", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "prevWord_keep_V_16", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_exh2rethShiftFifo_8", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2rethShiftFifo_8_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2rethShiftFifo_6", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2rethShiftFifo_6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2rethShiftFifo_7", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2rethShiftFifo_7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2rethShiftFifo_4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2rethShiftFifo_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rs_firstWord_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_rethSift2mergerFi_8", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_rethSift2mergerFi_8_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_rethSift2mergerFi_6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_rethSift2mergerFi_6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_rethSift2mergerFi_7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_rethSift2mergerFi_7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_rethSift2mergerFi_4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_rethSift2mergerFi_4_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	rshiftWordByOctet {
		fsmState_1 {Type IO LastRead -1 FirstWrite -1}
		prevWord_data_V_19 {Type IO LastRead -1 FirstWrite -1}
		prevWord_keep_V_16 {Type IO LastRead -1 FirstWrite -1}
		rx_exh2rethShiftFifo_8 {Type I LastRead 0 FirstWrite -1}
		rx_exh2rethShiftFifo_6 {Type I LastRead 0 FirstWrite -1}
		rx_exh2rethShiftFifo_7 {Type I LastRead 0 FirstWrite -1}
		rx_exh2rethShiftFifo_4 {Type I LastRead 0 FirstWrite -1}
		rs_firstWord_1 {Type IO LastRead -1 FirstWrite -1}
		rx_rethSift2mergerFi_8 {Type O LastRead -1 FirstWrite 1}
		rx_rethSift2mergerFi_6 {Type O LastRead -1 FirstWrite 1}
		rx_rethSift2mergerFi_7 {Type O LastRead -1 FirstWrite 1}
		rx_rethSift2mergerFi_4 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_exh2rethShiftFifo_8 { ap_fifo {  { rx_exh2rethShiftFifo_8_dout fifo_data 0 512 }  { rx_exh2rethShiftFifo_8_empty_n fifo_status 0 1 }  { rx_exh2rethShiftFifo_8_read fifo_update 1 1 } } }
	rx_exh2rethShiftFifo_6 { ap_fifo {  { rx_exh2rethShiftFifo_6_dout fifo_data 0 64 }  { rx_exh2rethShiftFifo_6_empty_n fifo_status 0 1 }  { rx_exh2rethShiftFifo_6_read fifo_update 1 1 } } }
	rx_exh2rethShiftFifo_7 { ap_fifo {  { rx_exh2rethShiftFifo_7_dout fifo_data 0 1 }  { rx_exh2rethShiftFifo_7_empty_n fifo_status 0 1 }  { rx_exh2rethShiftFifo_7_read fifo_update 1 1 } } }
	rx_exh2rethShiftFifo_4 { ap_fifo {  { rx_exh2rethShiftFifo_4_dout fifo_data 0 1 }  { rx_exh2rethShiftFifo_4_empty_n fifo_status 0 1 }  { rx_exh2rethShiftFifo_4_read fifo_update 1 1 } } }
	rx_rethSift2mergerFi_8 { ap_fifo {  { rx_rethSift2mergerFi_8_din fifo_data 1 512 }  { rx_rethSift2mergerFi_8_full_n fifo_status 0 1 }  { rx_rethSift2mergerFi_8_write fifo_update 1 1 } } }
	rx_rethSift2mergerFi_6 { ap_fifo {  { rx_rethSift2mergerFi_6_din fifo_data 1 64 }  { rx_rethSift2mergerFi_6_full_n fifo_status 0 1 }  { rx_rethSift2mergerFi_6_write fifo_update 1 1 } } }
	rx_rethSift2mergerFi_7 { ap_fifo {  { rx_rethSift2mergerFi_7_din fifo_data 1 1 }  { rx_rethSift2mergerFi_7_full_n fifo_status 0 1 }  { rx_rethSift2mergerFi_7_write fifo_update 1 1 } } }
	rx_rethSift2mergerFi_4 { ap_fifo {  { rx_rethSift2mergerFi_4_din fifo_data 1 1 }  { rx_rethSift2mergerFi_4_full_n fifo_status 0 1 }  { rx_rethSift2mergerFi_4_write fifo_update 1 1 } } }
}