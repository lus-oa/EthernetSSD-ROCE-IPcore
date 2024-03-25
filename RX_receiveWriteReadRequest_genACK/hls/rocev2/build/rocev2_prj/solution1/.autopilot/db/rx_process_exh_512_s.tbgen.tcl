set moduleName rx_process_exh_512_s
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
set C_modelName {rx_process_exh<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ rx_ibh2exh_MetaFifo_s_10 int 5 regular {fifo 0 volatile } {global 0}  }
	{ rx_shift2exhFifo_V_d int 512 regular {fifo 0 volatile } {global 0}  }
	{ rx_shift2exhFifo_V_k int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_shift2exhFifo_V_l int 1 regular {fifo 0 volatile } {global 0}  }
	{ rx_exh2dropFifo_V_da int 512 regular {fifo 1 volatile } {global 1}  }
	{ rx_exh2dropFifo_V_ke int 64 regular {fifo 1 volatile } {global 1}  }
	{ rx_exh2dropFifo_V_la int 1 regular {fifo 1 volatile } {global 1}  }
	{ rx_exhMetaFifo_V int 23 regular {fifo 1 volatile } {global 1}  }
	{ rx_exh2drop_MetaFifo_1 int 241 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rx_ibh2exh_MetaFifo_s_10", "interface" : "fifo", "bitwidth" : 5, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_shift2exhFifo_V_d", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_shift2exhFifo_V_k", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_shift2exhFifo_V_l", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2dropFifo_V_da", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2dropFifo_V_ke", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2dropFifo_V_la", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_exhMetaFifo_V", "interface" : "fifo", "bitwidth" : 23, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_exh2drop_MetaFifo_1", "interface" : "fifo", "bitwidth" : 241, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_shift2exhFifo_V_d_dout sc_in sc_lv 512 signal 1 } 
	{ rx_shift2exhFifo_V_d_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_shift2exhFifo_V_d_read sc_out sc_logic 1 signal 1 } 
	{ rx_shift2exhFifo_V_k_dout sc_in sc_lv 64 signal 2 } 
	{ rx_shift2exhFifo_V_k_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_shift2exhFifo_V_k_read sc_out sc_logic 1 signal 2 } 
	{ rx_shift2exhFifo_V_l_dout sc_in sc_lv 1 signal 3 } 
	{ rx_shift2exhFifo_V_l_empty_n sc_in sc_logic 1 signal 3 } 
	{ rx_shift2exhFifo_V_l_read sc_out sc_logic 1 signal 3 } 
	{ rx_ibh2exh_MetaFifo_s_10_dout sc_in sc_lv 5 signal 0 } 
	{ rx_ibh2exh_MetaFifo_s_10_empty_n sc_in sc_logic 1 signal 0 } 
	{ rx_ibh2exh_MetaFifo_s_10_read sc_out sc_logic 1 signal 0 } 
	{ rx_exh2dropFifo_V_da_din sc_out sc_lv 512 signal 4 } 
	{ rx_exh2dropFifo_V_da_full_n sc_in sc_logic 1 signal 4 } 
	{ rx_exh2dropFifo_V_da_write sc_out sc_logic 1 signal 4 } 
	{ rx_exh2dropFifo_V_ke_din sc_out sc_lv 64 signal 5 } 
	{ rx_exh2dropFifo_V_ke_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_exh2dropFifo_V_ke_write sc_out sc_logic 1 signal 5 } 
	{ rx_exh2dropFifo_V_la_din sc_out sc_lv 1 signal 6 } 
	{ rx_exh2dropFifo_V_la_full_n sc_in sc_logic 1 signal 6 } 
	{ rx_exh2dropFifo_V_la_write sc_out sc_logic 1 signal 6 } 
	{ rx_exhMetaFifo_V_din sc_out sc_lv 23 signal 7 } 
	{ rx_exhMetaFifo_V_full_n sc_in sc_logic 1 signal 7 } 
	{ rx_exhMetaFifo_V_write sc_out sc_logic 1 signal 7 } 
	{ rx_exh2drop_MetaFifo_1_din sc_out sc_lv 241 signal 8 } 
	{ rx_exh2drop_MetaFifo_1_full_n sc_in sc_logic 1 signal 8 } 
	{ rx_exh2drop_MetaFifo_1_write sc_out sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_shift2exhFifo_V_d_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_shift2exhFifo_V_d", "role": "dout" }} , 
 	{ "name": "rx_shift2exhFifo_V_d_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_shift2exhFifo_V_d", "role": "empty_n" }} , 
 	{ "name": "rx_shift2exhFifo_V_d_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_shift2exhFifo_V_d", "role": "read" }} , 
 	{ "name": "rx_shift2exhFifo_V_k_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_shift2exhFifo_V_k", "role": "dout" }} , 
 	{ "name": "rx_shift2exhFifo_V_k_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_shift2exhFifo_V_k", "role": "empty_n" }} , 
 	{ "name": "rx_shift2exhFifo_V_k_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_shift2exhFifo_V_k", "role": "read" }} , 
 	{ "name": "rx_shift2exhFifo_V_l_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_shift2exhFifo_V_l", "role": "dout" }} , 
 	{ "name": "rx_shift2exhFifo_V_l_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_shift2exhFifo_V_l", "role": "empty_n" }} , 
 	{ "name": "rx_shift2exhFifo_V_l_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_shift2exhFifo_V_l", "role": "read" }} , 
 	{ "name": "rx_ibh2exh_MetaFifo_s_10_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "rx_ibh2exh_MetaFifo_s_10", "role": "dout" }} , 
 	{ "name": "rx_ibh2exh_MetaFifo_s_10_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibh2exh_MetaFifo_s_10", "role": "empty_n" }} , 
 	{ "name": "rx_ibh2exh_MetaFifo_s_10_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibh2exh_MetaFifo_s_10", "role": "read" }} , 
 	{ "name": "rx_exh2dropFifo_V_da_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_da", "role": "din" }} , 
 	{ "name": "rx_exh2dropFifo_V_da_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_da", "role": "full_n" }} , 
 	{ "name": "rx_exh2dropFifo_V_da_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_da", "role": "write" }} , 
 	{ "name": "rx_exh2dropFifo_V_ke_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_ke", "role": "din" }} , 
 	{ "name": "rx_exh2dropFifo_V_ke_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_ke", "role": "full_n" }} , 
 	{ "name": "rx_exh2dropFifo_V_ke_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_ke", "role": "write" }} , 
 	{ "name": "rx_exh2dropFifo_V_la_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_la", "role": "din" }} , 
 	{ "name": "rx_exh2dropFifo_V_la_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_la", "role": "full_n" }} , 
 	{ "name": "rx_exh2dropFifo_V_la_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2dropFifo_V_la", "role": "write" }} , 
 	{ "name": "rx_exhMetaFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "rx_exhMetaFifo_V", "role": "din" }} , 
 	{ "name": "rx_exhMetaFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhMetaFifo_V", "role": "full_n" }} , 
 	{ "name": "rx_exhMetaFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhMetaFifo_V", "role": "write" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":241, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo_1", "role": "din" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo_1", "role": "full_n" }} , 
 	{ "name": "rx_exh2drop_MetaFifo_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exh2drop_MetaFifo_1", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "rx_process_exh_512_s",
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
			{"Name" : "state_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "opCode", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "metaWritten_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_ibh2exh_MetaFifo_s_10", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibh2exh_MetaFifo_s_10_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_shift2exhFifo_V_d", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_shift2exhFifo_V_d_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_shift2exhFifo_V_k", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_shift2exhFifo_V_k_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_shift2exhFifo_V_l", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_shift2exhFifo_V_l_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ackHeader_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ackHeader_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ackHeader_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_exh2dropFifo_V_da", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2dropFifo_V_da_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2dropFifo_V_ke", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2dropFifo_V_ke_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2dropFifo_V_la", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2dropFifo_V_la_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exhMetaFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exhMetaFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exh2drop_MetaFifo_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exh2drop_MetaFifo_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rdmaHeader_ready", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rdmaHeader_idx", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rdmaHeader_header_V", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rocev2_top_mux_325_1_1_1_U106", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rocev2_top_mux_325_1_1_1_U107", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rocev2_top_mux_325_1_1_1_U108", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rx_process_exh_512_s {
		state_1 {Type IO LastRead -1 FirstWrite -1}
		opCode {Type IO LastRead -1 FirstWrite -1}
		metaWritten_1 {Type IO LastRead -1 FirstWrite -1}
		rx_ibh2exh_MetaFifo_s_10 {Type I LastRead 0 FirstWrite -1}
		rx_shift2exhFifo_V_d {Type I LastRead 0 FirstWrite -1}
		rx_shift2exhFifo_V_k {Type I LastRead 0 FirstWrite -1}
		rx_shift2exhFifo_V_l {Type I LastRead 0 FirstWrite -1}
		ackHeader_ready {Type IO LastRead -1 FirstWrite -1}
		ackHeader_idx {Type IO LastRead -1 FirstWrite -1}
		ackHeader_header_V {Type IO LastRead -1 FirstWrite -1}
		rx_exh2dropFifo_V_da {Type O LastRead -1 FirstWrite 1}
		rx_exh2dropFifo_V_ke {Type O LastRead -1 FirstWrite 1}
		rx_exh2dropFifo_V_la {Type O LastRead -1 FirstWrite 1}
		rx_exhMetaFifo_V {Type O LastRead -1 FirstWrite 1}
		rx_exh2drop_MetaFifo_1 {Type O LastRead -1 FirstWrite 1}
		rdmaHeader_ready {Type IO LastRead -1 FirstWrite -1}
		rdmaHeader_idx {Type IO LastRead -1 FirstWrite -1}
		rdmaHeader_header_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rx_ibh2exh_MetaFifo_s_10 { ap_fifo {  { rx_ibh2exh_MetaFifo_s_10_dout fifo_data 0 5 }  { rx_ibh2exh_MetaFifo_s_10_empty_n fifo_status 0 1 }  { rx_ibh2exh_MetaFifo_s_10_read fifo_update 1 1 } } }
	rx_shift2exhFifo_V_d { ap_fifo {  { rx_shift2exhFifo_V_d_dout fifo_data 0 512 }  { rx_shift2exhFifo_V_d_empty_n fifo_status 0 1 }  { rx_shift2exhFifo_V_d_read fifo_update 1 1 } } }
	rx_shift2exhFifo_V_k { ap_fifo {  { rx_shift2exhFifo_V_k_dout fifo_data 0 64 }  { rx_shift2exhFifo_V_k_empty_n fifo_status 0 1 }  { rx_shift2exhFifo_V_k_read fifo_update 1 1 } } }
	rx_shift2exhFifo_V_l { ap_fifo {  { rx_shift2exhFifo_V_l_dout fifo_data 0 1 }  { rx_shift2exhFifo_V_l_empty_n fifo_status 0 1 }  { rx_shift2exhFifo_V_l_read fifo_update 1 1 } } }
	rx_exh2dropFifo_V_da { ap_fifo {  { rx_exh2dropFifo_V_da_din fifo_data 1 512 }  { rx_exh2dropFifo_V_da_full_n fifo_status 0 1 }  { rx_exh2dropFifo_V_da_write fifo_update 1 1 } } }
	rx_exh2dropFifo_V_ke { ap_fifo {  { rx_exh2dropFifo_V_ke_din fifo_data 1 64 }  { rx_exh2dropFifo_V_ke_full_n fifo_status 0 1 }  { rx_exh2dropFifo_V_ke_write fifo_update 1 1 } } }
	rx_exh2dropFifo_V_la { ap_fifo {  { rx_exh2dropFifo_V_la_din fifo_data 1 1 }  { rx_exh2dropFifo_V_la_full_n fifo_status 0 1 }  { rx_exh2dropFifo_V_la_write fifo_update 1 1 } } }
	rx_exhMetaFifo_V { ap_fifo {  { rx_exhMetaFifo_V_din fifo_data 1 23 }  { rx_exhMetaFifo_V_full_n fifo_status 0 1 }  { rx_exhMetaFifo_V_write fifo_update 1 1 } } }
	rx_exh2drop_MetaFifo_1 { ap_fifo {  { rx_exh2drop_MetaFifo_1_din fifo_data 1 241 }  { rx_exh2drop_MetaFifo_1_full_n fifo_status 0 1 }  { rx_exh2drop_MetaFifo_1_write fifo_update 1 1 } } }
}
