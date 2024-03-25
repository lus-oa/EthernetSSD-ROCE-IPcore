set moduleName msn_table
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
set C_modelName {msn_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ rxExh2msnTable_upd_r_1 int 137 regular {fifo 0 volatile } {global 0}  }
	{ msnTable2rxExh_rsp_V int 152 regular {fifo 1 volatile } {global 1}  }
	{ txExh2msnTable_req_V int 16 regular {fifo 0 volatile } {global 0}  }
	{ msnTable2txExh_rsp_V int 56 regular {fifo 1 volatile } {global 1}  }
	{ if2msnTable_init_V int 48 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rxExh2msnTable_upd_r_1", "interface" : "fifo", "bitwidth" : 137, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "msnTable2rxExh_rsp_V", "interface" : "fifo", "bitwidth" : 152, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txExh2msnTable_req_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "msnTable2txExh_rsp_V", "interface" : "fifo", "bitwidth" : 56, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "if2msnTable_init_V", "interface" : "fifo", "bitwidth" : 48, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 22
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rxExh2msnTable_upd_r_1_dout sc_in sc_lv 137 signal 0 } 
	{ rxExh2msnTable_upd_r_1_empty_n sc_in sc_logic 1 signal 0 } 
	{ rxExh2msnTable_upd_r_1_read sc_out sc_logic 1 signal 0 } 
	{ txExh2msnTable_req_V_dout sc_in sc_lv 16 signal 2 } 
	{ txExh2msnTable_req_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ txExh2msnTable_req_V_read sc_out sc_logic 1 signal 2 } 
	{ if2msnTable_init_V_dout sc_in sc_lv 48 signal 4 } 
	{ if2msnTable_init_V_empty_n sc_in sc_logic 1 signal 4 } 
	{ if2msnTable_init_V_read sc_out sc_logic 1 signal 4 } 
	{ msnTable2txExh_rsp_V_din sc_out sc_lv 56 signal 3 } 
	{ msnTable2txExh_rsp_V_full_n sc_in sc_logic 1 signal 3 } 
	{ msnTable2txExh_rsp_V_write sc_out sc_logic 1 signal 3 } 
	{ msnTable2rxExh_rsp_V_din sc_out sc_lv 152 signal 1 } 
	{ msnTable2rxExh_rsp_V_full_n sc_in sc_logic 1 signal 1 } 
	{ msnTable2rxExh_rsp_V_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rxExh2msnTable_upd_r_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":137, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_r_1", "role": "dout" }} , 
 	{ "name": "rxExh2msnTable_upd_r_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_r_1", "role": "empty_n" }} , 
 	{ "name": "rxExh2msnTable_upd_r_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_r_1", "role": "read" }} , 
 	{ "name": "txExh2msnTable_req_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "txExh2msnTable_req_V", "role": "dout" }} , 
 	{ "name": "txExh2msnTable_req_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txExh2msnTable_req_V", "role": "empty_n" }} , 
 	{ "name": "txExh2msnTable_req_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txExh2msnTable_req_V", "role": "read" }} , 
 	{ "name": "if2msnTable_init_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "if2msnTable_init_V", "role": "dout" }} , 
 	{ "name": "if2msnTable_init_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "if2msnTable_init_V", "role": "empty_n" }} , 
 	{ "name": "if2msnTable_init_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "if2msnTable_init_V", "role": "read" }} , 
 	{ "name": "msnTable2txExh_rsp_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp_V", "role": "din" }} , 
 	{ "name": "msnTable2txExh_rsp_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp_V", "role": "full_n" }} , 
 	{ "name": "msnTable2txExh_rsp_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp_V", "role": "write" }} , 
 	{ "name": "msnTable2rxExh_rsp_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":152, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp_V", "role": "din" }} , 
 	{ "name": "msnTable2rxExh_rsp_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp_V", "role": "full_n" }} , 
 	{ "name": "msnTable2rxExh_rsp_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4"],
		"CDFG" : "msn_table",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "Aligned", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "3", "EstimateLatencyMin" : "3", "EstimateLatencyMax" : "3",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "1",
		"Port" : [
			{"Name" : "rxExh2msnTable_upd_r_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rxExh2msnTable_upd_r_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "msn_table_msn_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "msn_table_vaddr_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "msn_table_dma_length", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "msn_table_r_key_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "msnTable2rxExh_rsp_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "msnTable2rxExh_rsp_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txExh2msnTable_req_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "txExh2msnTable_req_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "msnTable2txExh_rsp_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "msnTable2txExh_rsp_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "if2msnTable_init_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "if2msnTable_init_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.msn_table_msn_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.msn_table_vaddr_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.msn_table_dma_length_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.msn_table_r_key_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	msn_table {
		rxExh2msnTable_upd_r_1 {Type I LastRead 0 FirstWrite -1}
		msn_table_msn_V {Type IO LastRead -1 FirstWrite -1}
		msn_table_vaddr_V {Type IO LastRead -1 FirstWrite -1}
		msn_table_dma_length {Type IO LastRead -1 FirstWrite -1}
		msn_table_r_key_V {Type IO LastRead -1 FirstWrite -1}
		msnTable2rxExh_rsp_V {Type O LastRead -1 FirstWrite 3}
		txExh2msnTable_req_V {Type I LastRead 1 FirstWrite -1}
		msnTable2txExh_rsp_V {Type O LastRead -1 FirstWrite 3}
		if2msnTable_init_V {Type I LastRead 2 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rxExh2msnTable_upd_r_1 { ap_fifo {  { rxExh2msnTable_upd_r_1_dout fifo_data 0 137 }  { rxExh2msnTable_upd_r_1_empty_n fifo_status 0 1 }  { rxExh2msnTable_upd_r_1_read fifo_update 1 1 } } }
	msnTable2rxExh_rsp_V { ap_fifo {  { msnTable2rxExh_rsp_V_din fifo_data 1 152 }  { msnTable2rxExh_rsp_V_full_n fifo_status 0 1 }  { msnTable2rxExh_rsp_V_write fifo_update 1 1 } } }
	txExh2msnTable_req_V { ap_fifo {  { txExh2msnTable_req_V_dout fifo_data 0 16 }  { txExh2msnTable_req_V_empty_n fifo_status 0 1 }  { txExh2msnTable_req_V_read fifo_update 1 1 } } }
	msnTable2txExh_rsp_V { ap_fifo {  { msnTable2txExh_rsp_V_din fifo_data 1 56 }  { msnTable2txExh_rsp_V_full_n fifo_status 0 1 }  { msnTable2txExh_rsp_V_write fifo_update 1 1 } } }
	if2msnTable_init_V { ap_fifo {  { if2msnTable_init_V_dout fifo_data 0 48 }  { if2msnTable_init_V_empty_n fifo_status 0 1 }  { if2msnTable_init_V_read fifo_update 1 1 } } }
}
