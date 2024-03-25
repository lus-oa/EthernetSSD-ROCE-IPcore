set moduleName mq_meta_table
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
set C_modelName {mq_meta_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ mq_metaReqFifo_V_idx int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaReqFifo_V_ent int 64 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaReqFifo_V_ent_3 int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaReqFifo_V_ent_4 int 1 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaReqFifo_V_ent_1 int 1 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaReqFifo_V_wri int 1 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaReqFifo_V_app int 1 regular {fifo 0 volatile } {global 0}  }
	{ mq_metaRspFifo_V_val int 64 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaRspFifo_V_nex int 16 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaRspFifo_V_val_1 int 1 regular {fifo 1 volatile } {global 1}  }
	{ mq_metaRspFifo_V_isT int 1 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mq_metaReqFifo_V_idx", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_ent", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_ent_3", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_ent_4", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_ent_1", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_wri", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaReqFifo_V_app", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo_V_val", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo_V_nex", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo_V_val_1", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_metaRspFifo_V_isT", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 40
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ mq_metaReqFifo_V_idx_dout sc_in sc_lv 16 signal 0 } 
	{ mq_metaReqFifo_V_idx_empty_n sc_in sc_logic 1 signal 0 } 
	{ mq_metaReqFifo_V_idx_read sc_out sc_logic 1 signal 0 } 
	{ mq_metaReqFifo_V_ent_dout sc_in sc_lv 64 signal 1 } 
	{ mq_metaReqFifo_V_ent_empty_n sc_in sc_logic 1 signal 1 } 
	{ mq_metaReqFifo_V_ent_read sc_out sc_logic 1 signal 1 } 
	{ mq_metaReqFifo_V_ent_3_dout sc_in sc_lv 16 signal 2 } 
	{ mq_metaReqFifo_V_ent_3_empty_n sc_in sc_logic 1 signal 2 } 
	{ mq_metaReqFifo_V_ent_3_read sc_out sc_logic 1 signal 2 } 
	{ mq_metaReqFifo_V_ent_4_dout sc_in sc_lv 1 signal 3 } 
	{ mq_metaReqFifo_V_ent_4_empty_n sc_in sc_logic 1 signal 3 } 
	{ mq_metaReqFifo_V_ent_4_read sc_out sc_logic 1 signal 3 } 
	{ mq_metaReqFifo_V_ent_1_dout sc_in sc_lv 1 signal 4 } 
	{ mq_metaReqFifo_V_ent_1_empty_n sc_in sc_logic 1 signal 4 } 
	{ mq_metaReqFifo_V_ent_1_read sc_out sc_logic 1 signal 4 } 
	{ mq_metaReqFifo_V_wri_dout sc_in sc_lv 1 signal 5 } 
	{ mq_metaReqFifo_V_wri_empty_n sc_in sc_logic 1 signal 5 } 
	{ mq_metaReqFifo_V_wri_read sc_out sc_logic 1 signal 5 } 
	{ mq_metaReqFifo_V_app_dout sc_in sc_lv 1 signal 6 } 
	{ mq_metaReqFifo_V_app_empty_n sc_in sc_logic 1 signal 6 } 
	{ mq_metaReqFifo_V_app_read sc_out sc_logic 1 signal 6 } 
	{ mq_metaRspFifo_V_val_din sc_out sc_lv 64 signal 7 } 
	{ mq_metaRspFifo_V_val_full_n sc_in sc_logic 1 signal 7 } 
	{ mq_metaRspFifo_V_val_write sc_out sc_logic 1 signal 7 } 
	{ mq_metaRspFifo_V_nex_din sc_out sc_lv 16 signal 8 } 
	{ mq_metaRspFifo_V_nex_full_n sc_in sc_logic 1 signal 8 } 
	{ mq_metaRspFifo_V_nex_write sc_out sc_logic 1 signal 8 } 
	{ mq_metaRspFifo_V_val_1_din sc_out sc_lv 1 signal 9 } 
	{ mq_metaRspFifo_V_val_1_full_n sc_in sc_logic 1 signal 9 } 
	{ mq_metaRspFifo_V_val_1_write sc_out sc_logic 1 signal 9 } 
	{ mq_metaRspFifo_V_isT_din sc_out sc_lv 1 signal 10 } 
	{ mq_metaRspFifo_V_isT_full_n sc_in sc_logic 1 signal 10 } 
	{ mq_metaRspFifo_V_isT_write sc_out sc_logic 1 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mq_metaReqFifo_V_idx_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_idx", "role": "dout" }} , 
 	{ "name": "mq_metaReqFifo_V_idx_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_idx", "role": "empty_n" }} , 
 	{ "name": "mq_metaReqFifo_V_idx_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_idx", "role": "read" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent", "role": "dout" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent", "role": "empty_n" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent", "role": "read" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_3", "role": "dout" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_3", "role": "empty_n" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_3", "role": "read" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_4_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_4", "role": "dout" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_4_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_4", "role": "empty_n" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_4_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_4", "role": "read" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_1", "role": "dout" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_1", "role": "empty_n" }} , 
 	{ "name": "mq_metaReqFifo_V_ent_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_ent_1", "role": "read" }} , 
 	{ "name": "mq_metaReqFifo_V_wri_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_wri", "role": "dout" }} , 
 	{ "name": "mq_metaReqFifo_V_wri_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_wri", "role": "empty_n" }} , 
 	{ "name": "mq_metaReqFifo_V_wri_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_wri", "role": "read" }} , 
 	{ "name": "mq_metaReqFifo_V_app_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_app", "role": "dout" }} , 
 	{ "name": "mq_metaReqFifo_V_app_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_app", "role": "empty_n" }} , 
 	{ "name": "mq_metaReqFifo_V_app_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaReqFifo_V_app", "role": "read" }} , 
 	{ "name": "mq_metaRspFifo_V_val_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val", "role": "din" }} , 
 	{ "name": "mq_metaRspFifo_V_val_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val", "role": "full_n" }} , 
 	{ "name": "mq_metaRspFifo_V_val_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val", "role": "write" }} , 
 	{ "name": "mq_metaRspFifo_V_nex_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_nex", "role": "din" }} , 
 	{ "name": "mq_metaRspFifo_V_nex_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_nex", "role": "full_n" }} , 
 	{ "name": "mq_metaRspFifo_V_nex_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_nex", "role": "write" }} , 
 	{ "name": "mq_metaRspFifo_V_val_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val_1", "role": "din" }} , 
 	{ "name": "mq_metaRspFifo_V_val_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val_1", "role": "full_n" }} , 
 	{ "name": "mq_metaRspFifo_V_val_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_val_1", "role": "write" }} , 
 	{ "name": "mq_metaRspFifo_V_isT_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_isT", "role": "din" }} , 
 	{ "name": "mq_metaRspFifo_V_isT_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_isT", "role": "full_n" }} , 
 	{ "name": "mq_metaRspFifo_V_isT_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_metaRspFifo_V_isT", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "mq_meta_table",
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
			{"Name" : "mq_metaReqFifo_V_idx", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_idx_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_ent", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_ent_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_ent_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_ent_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_ent_4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_ent_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_ent_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_ent_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_wri", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_wri_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaReqFifo_V_app", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaReqFifo_V_app_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "meta_table_value_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "meta_table_next_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "meta_table_valid", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "meta_table_isTail", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "mq_metaRspFifo_V_val", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_V_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaRspFifo_V_nex", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_V_nex_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaRspFifo_V_val_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_V_val_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_metaRspFifo_V_isT", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_metaRspFifo_V_isT_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.meta_table_value_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.meta_table_next_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.meta_table_valid_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.meta_table_isTail_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mq_meta_table {
		mq_metaReqFifo_V_idx {Type I LastRead 0 FirstWrite -1}
		mq_metaReqFifo_V_ent {Type I LastRead 0 FirstWrite -1}
		mq_metaReqFifo_V_ent_3 {Type I LastRead 0 FirstWrite -1}
		mq_metaReqFifo_V_ent_4 {Type I LastRead 0 FirstWrite -1}
		mq_metaReqFifo_V_ent_1 {Type I LastRead 0 FirstWrite -1}
		mq_metaReqFifo_V_wri {Type I LastRead 0 FirstWrite -1}
		mq_metaReqFifo_V_app {Type I LastRead 0 FirstWrite -1}
		meta_table_value_V {Type IO LastRead -1 FirstWrite -1}
		meta_table_next_V {Type IO LastRead -1 FirstWrite -1}
		meta_table_valid {Type IO LastRead -1 FirstWrite -1}
		meta_table_isTail {Type IO LastRead -1 FirstWrite -1}
		mq_metaRspFifo_V_val {Type O LastRead -1 FirstWrite 1}
		mq_metaRspFifo_V_nex {Type O LastRead -1 FirstWrite 1}
		mq_metaRspFifo_V_val_1 {Type O LastRead -1 FirstWrite 1}
		mq_metaRspFifo_V_isT {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mq_metaReqFifo_V_idx { ap_fifo {  { mq_metaReqFifo_V_idx_dout fifo_data 0 16 }  { mq_metaReqFifo_V_idx_empty_n fifo_status 0 1 }  { mq_metaReqFifo_V_idx_read fifo_update 1 1 } } }
	mq_metaReqFifo_V_ent { ap_fifo {  { mq_metaReqFifo_V_ent_dout fifo_data 0 64 }  { mq_metaReqFifo_V_ent_empty_n fifo_status 0 1 }  { mq_metaReqFifo_V_ent_read fifo_update 1 1 } } }
	mq_metaReqFifo_V_ent_3 { ap_fifo {  { mq_metaReqFifo_V_ent_3_dout fifo_data 0 16 }  { mq_metaReqFifo_V_ent_3_empty_n fifo_status 0 1 }  { mq_metaReqFifo_V_ent_3_read fifo_update 1 1 } } }
	mq_metaReqFifo_V_ent_4 { ap_fifo {  { mq_metaReqFifo_V_ent_4_dout fifo_data 0 1 }  { mq_metaReqFifo_V_ent_4_empty_n fifo_status 0 1 }  { mq_metaReqFifo_V_ent_4_read fifo_update 1 1 } } }
	mq_metaReqFifo_V_ent_1 { ap_fifo {  { mq_metaReqFifo_V_ent_1_dout fifo_data 0 1 }  { mq_metaReqFifo_V_ent_1_empty_n fifo_status 0 1 }  { mq_metaReqFifo_V_ent_1_read fifo_update 1 1 } } }
	mq_metaReqFifo_V_wri { ap_fifo {  { mq_metaReqFifo_V_wri_dout fifo_data 0 1 }  { mq_metaReqFifo_V_wri_empty_n fifo_status 0 1 }  { mq_metaReqFifo_V_wri_read fifo_update 1 1 } } }
	mq_metaReqFifo_V_app { ap_fifo {  { mq_metaReqFifo_V_app_dout fifo_data 0 1 }  { mq_metaReqFifo_V_app_empty_n fifo_status 0 1 }  { mq_metaReqFifo_V_app_read fifo_update 1 1 } } }
	mq_metaRspFifo_V_val { ap_fifo {  { mq_metaRspFifo_V_val_din fifo_data 1 64 }  { mq_metaRspFifo_V_val_full_n fifo_status 0 1 }  { mq_metaRspFifo_V_val_write fifo_update 1 1 } } }
	mq_metaRspFifo_V_nex { ap_fifo {  { mq_metaRspFifo_V_nex_din fifo_data 1 16 }  { mq_metaRspFifo_V_nex_full_n fifo_status 0 1 }  { mq_metaRspFifo_V_nex_write fifo_update 1 1 } } }
	mq_metaRspFifo_V_val_1 { ap_fifo {  { mq_metaRspFifo_V_val_1_din fifo_data 1 1 }  { mq_metaRspFifo_V_val_1_full_n fifo_status 0 1 }  { mq_metaRspFifo_V_val_1_write fifo_update 1 1 } } }
	mq_metaRspFifo_V_isT { ap_fifo {  { mq_metaRspFifo_V_isT_din fifo_data 1 1 }  { mq_metaRspFifo_V_isT_full_n fifo_status 0 1 }  { mq_metaRspFifo_V_isT_write fifo_update 1 1 } } }
}
