set moduleName drop_ooo_ibh_512_s
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
set C_modelName {drop_ooo_ibh<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_ibhDropFifo_V int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2dropFifo_V_da int 512 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2dropFifo_V_ke int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2dropFifo_V_la int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_ibhDrop2exhFifo_V_1 int 512 regular {fifo 1 volatile } {global 1}  }
	{ rx_ibhDrop2exhFifo_V_2 int 64 regular {fifo 1 volatile } {global 1}  }
	{ rx_ibhDrop2exhFifo_V int 1 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_ibhDropFifo_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2dropFifo_V_da", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2dropFifo_V_ke", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2dropFifo_V_la", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDrop2exhFifo_V_1", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDrop2exhFifo_V_2", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDrop2exhFifo_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ rx_exh2dropFifo_V_da_dout sc_in sc_lv 512 signal 1 } 
	{ rx_exh2dropFifo_V_da_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_exh2dropFifo_V_da_read sc_out sc_logic 1 signal 1 } 
	{ rx_exh2dropFifo_V_ke_dout sc_in sc_lv 64 signal 2 } 
	{ rx_exh2dropFifo_V_ke_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_exh2dropFifo_V_ke_read sc_out sc_logic 1 signal 2 } 
	{ rx_exh2dropFifo_V_la_dout sc_in sc_lv 1 signal 3 } 
	{ rx_exh2dropFifo_V_la_empty_n sc_in sc_logic 1 signal 3 } 
	{ rx_exh2dropFifo_V_la_read sc_out sc_logic 1 signal 3 } 
	{ rx_ibhDropFifo_V_dout sc_in sc_lv 1 signal 0 } 
	{ rx_ibhDropFifo_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_ibhDropFifo_V_read sc_out sc_logic 1 signal 0 } 
	{ rx_ibhDrop2exhFifo_V_1_din sc_out sc_lv 512 signal 4 } 
	{ rx_ibhDrop2exhFifo_V_1_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_ibhDrop2exhFifo_V_1_write sc_out sc_logic 1 signal 4 } 
	{ rx_ibhDrop2exhFifo_V_2_din sc_out sc_lv 64 signal 5 } 
	{ rx_ibhDrop2exhFifo_V_2_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_ibhDrop2exhFifo_V_2_write sc_out sc_logic 1 signal 5 } 
	{ rx_ibhDrop2exhFifo_V_din sc_out sc_lv 1 signal 6 } 
	{ rx_ibhDrop2exhFifo_V_full_n sc_in sc_logic 1 signal 6 } 
	{ rx_ibhDrop2exhFifo_V_write sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_exh2dropFifo_V_da_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_da", "role": "dout" }} , 
 	{ "name": "rx_exh2dropFifo_V_da_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_da", "role": "empty_n" }} , 
 	{ "name": "rx_exh2dropFifo_V_da_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_da", "role": "read" }} , 
 	{ "name": "rx_exh2dropFifo_V_ke_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_ke", "role": "dout" }} , 
 	{ "name": "rx_exh2dropFifo_V_ke_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_ke", "role": "empty_n" }} , 
 	{ "name": "rx_exh2dropFifo_V_ke_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_ke", "role": "read" }} , 
 	{ "name": "rx_exh2dropFifo_V_la_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_la", "role": "dout" }} , 
 	{ "name": "rx_exh2dropFifo_V_la_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_la", "role": "empty_n" }} , 
 	{ "name": "rx_exh2dropFifo_V_la_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_la", "role": "read" }} , 
 	{ "name": "rx_ibhDropFifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo_V", "role": "dout" }} , 
 	{ "name": "rx_ibhDropFifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo_V", "role": "empty_n" }} , 
 	{ "name": "rx_ibhDropFifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo_V", "role": "read" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_V_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo_V_1", "role": "din" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_V_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo_V_1", "role": "full_n" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_V_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo_V_1", "role": "write" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_V_2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo_V_2", "role": "din" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_V_2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo_V_2", "role": "full_n" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_V_2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo_V_2", "role": "write" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo_V", "role": "din" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo_V", "role": "full_n" }} , 
 	{ "name": "rx_ibhDrop2exhFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDrop2exhFifo_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "drop_ooo_ibh_512_s",
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
			{"Name" : "state_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_ibhDropFifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDropFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2dropFifo_V_da", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2dropFifo_V_da_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2dropFifo_V_ke", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2dropFifo_V_ke_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2dropFifo_V_la", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2dropFifo_V_la_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhDrop2exhFifo_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDrop2exhFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhDrop2exhFifo_V_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDrop2exhFifo_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhDrop2exhFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDrop2exhFifo_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	drop_ooo_ibh_512_s {
		state_5 {Type IO LastRead -1 FirstWrite -1}
		rx_ibhDropFifo_V {Type I LastRead 0 FirstWrite -1}
		rx_exh2dropFifo_V_da {Type I LastRead 0 FirstWrite -1}
		rx_exh2dropFifo_V_ke {Type I LastRead 0 FirstWrite -1}
		rx_exh2dropFifo_V_la {Type I LastRead 0 FirstWrite -1}
		rx_ibhDrop2exhFifo_V_1 {Type O LastRead -1 FirstWrite 1}
		rx_ibhDrop2exhFifo_V_2 {Type O LastRead -1 FirstWrite 1}
		rx_ibhDrop2exhFifo_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_ibhDropFifo_V { ap_fifo {  { rx_ibhDropFifo_V_dout fifo_data 0 1 }  { rx_ibhDropFifo_V_empty_n fifo_status 0 1 }  { rx_ibhDropFifo_V_read fifo_update 1 1 } } }
	rx_exh2dropFifo_V_da { ap_fifo {  { rx_exh2dropFifo_V_da_dout fifo_data 0 512 }  { rx_exh2dropFifo_V_da_empty_n fifo_status 0 1 }  { rx_exh2dropFifo_V_da_read fifo_update 1 1 } } }
	rx_exh2dropFifo_V_ke { ap_fifo {  { rx_exh2dropFifo_V_ke_dout fifo_data 0 64 }  { rx_exh2dropFifo_V_ke_empty_n fifo_status 0 1 }  { rx_exh2dropFifo_V_ke_read fifo_update 1 1 } } }
	rx_exh2dropFifo_V_la { ap_fifo {  { rx_exh2dropFifo_V_la_dout fifo_data 0 1 }  { rx_exh2dropFifo_V_la_empty_n fifo_status 0 1 }  { rx_exh2dropFifo_V_la_read fifo_update 1 1 } } }
	rx_ibhDrop2exhFifo_V_1 { ap_fifo {  { rx_ibhDrop2exhFifo_V_1_din fifo_data 1 512 }  { rx_ibhDrop2exhFifo_V_1_full_n fifo_status 0 1 }  { rx_ibhDrop2exhFifo_V_1_write fifo_update 1 1 } } }
	rx_ibhDrop2exhFifo_V_2 { ap_fifo {  { rx_ibhDrop2exhFifo_V_2_din fifo_data 1 64 }  { rx_ibhDrop2exhFifo_V_2_full_n fifo_status 0 1 }  { rx_ibhDrop2exhFifo_V_2_write fifo_update 1 1 } } }
	rx_ibhDrop2exhFifo_V { ap_fifo {  { rx_ibhDrop2exhFifo_V_din fifo_data 1 1 }  { rx_ibhDrop2exhFifo_V_full_n fifo_status 0 1 }  { rx_ibhDrop2exhFifo_V_write fifo_update 1 1 } } }
}
