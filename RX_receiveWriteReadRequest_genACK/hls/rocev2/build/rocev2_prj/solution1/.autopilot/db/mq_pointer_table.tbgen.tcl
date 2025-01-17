set moduleName mq_pointer_table
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
set C_modelName {mq_pointer_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ mq_pointerUpdFifo_V_s int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerUpdFifo_V_1 int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerUpdFifo_V_3 int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerUpdFifo_V_4 int 1 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerReqFifo_V_1 int 16 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerReqFifo_V_s int 1 regular {fifo 0 volatile } {global 0}  }
	{ mq_pointerRspFifo_V_1 int 16 regular {fifo 1 volatile } {global 1}  }
	{ mq_pointerRspFifo_V_2 int 16 regular {fifo 1 volatile } {global 1}  }
	{ mq_pointerRspFifo_V_s int 1 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "mq_pointerUpdFifo_V_s", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerUpdFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerUpdFifo_V_3", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerUpdFifo_V_4", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerReqFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerReqFifo_V_s", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerRspFifo_V_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerRspFifo_V_2", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "mq_pointerRspFifo_V_s", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ mq_pointerUpdFifo_V_s_dout sc_in sc_lv 16 signal 0 } 
	{ mq_pointerUpdFifo_V_s_empty_n sc_in sc_logic 1 signal 0 } 
	{ mq_pointerUpdFifo_V_s_read sc_out sc_logic 1 signal 0 } 
	{ mq_pointerUpdFifo_V_1_dout sc_in sc_lv 16 signal 1 } 
	{ mq_pointerUpdFifo_V_1_empty_n sc_in sc_logic 1 signal 1 } 
	{ mq_pointerUpdFifo_V_1_read sc_out sc_logic 1 signal 1 } 
	{ mq_pointerUpdFifo_V_3_dout sc_in sc_lv 16 signal 2 } 
	{ mq_pointerUpdFifo_V_3_empty_n sc_in sc_logic 1 signal 2 } 
	{ mq_pointerUpdFifo_V_3_read sc_out sc_logic 1 signal 2 } 
	{ mq_pointerUpdFifo_V_4_dout sc_in sc_lv 1 signal 3 } 
	{ mq_pointerUpdFifo_V_4_empty_n sc_in sc_logic 1 signal 3 } 
	{ mq_pointerUpdFifo_V_4_read sc_out sc_logic 1 signal 3 } 
	{ mq_pointerReqFifo_V_1_dout sc_in sc_lv 16 signal 4 } 
	{ mq_pointerReqFifo_V_1_empty_n sc_in sc_logic 1 signal 4 } 
	{ mq_pointerReqFifo_V_1_read sc_out sc_logic 1 signal 4 } 
	{ mq_pointerReqFifo_V_s_dout sc_in sc_lv 1 signal 5 } 
	{ mq_pointerReqFifo_V_s_empty_n sc_in sc_logic 1 signal 5 } 
	{ mq_pointerReqFifo_V_s_read sc_out sc_logic 1 signal 5 } 
	{ mq_pointerRspFifo_V_1_din sc_out sc_lv 16 signal 6 } 
	{ mq_pointerRspFifo_V_1_full_n sc_in sc_logic 1 signal 6 } 
	{ mq_pointerRspFifo_V_1_write sc_out sc_logic 1 signal 6 } 
	{ mq_pointerRspFifo_V_2_din sc_out sc_lv 16 signal 7 } 
	{ mq_pointerRspFifo_V_2_full_n sc_in sc_logic 1 signal 7 } 
	{ mq_pointerRspFifo_V_2_write sc_out sc_logic 1 signal 7 } 
	{ mq_pointerRspFifo_V_s_din sc_out sc_lv 1 signal 8 } 
	{ mq_pointerRspFifo_V_s_full_n sc_in sc_logic 1 signal 8 } 
	{ mq_pointerRspFifo_V_s_write sc_out sc_logic 1 signal 8 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "mq_pointerUpdFifo_V_s_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_s", "role": "dout" }} , 
 	{ "name": "mq_pointerUpdFifo_V_s_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_s", "role": "empty_n" }} , 
 	{ "name": "mq_pointerUpdFifo_V_s_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_s", "role": "read" }} , 
 	{ "name": "mq_pointerUpdFifo_V_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_1", "role": "dout" }} , 
 	{ "name": "mq_pointerUpdFifo_V_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_1", "role": "empty_n" }} , 
 	{ "name": "mq_pointerUpdFifo_V_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_1", "role": "read" }} , 
 	{ "name": "mq_pointerUpdFifo_V_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_3", "role": "dout" }} , 
 	{ "name": "mq_pointerUpdFifo_V_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_3", "role": "empty_n" }} , 
 	{ "name": "mq_pointerUpdFifo_V_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_3", "role": "read" }} , 
 	{ "name": "mq_pointerUpdFifo_V_4_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_4", "role": "dout" }} , 
 	{ "name": "mq_pointerUpdFifo_V_4_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_4", "role": "empty_n" }} , 
 	{ "name": "mq_pointerUpdFifo_V_4_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerUpdFifo_V_4", "role": "read" }} , 
 	{ "name": "mq_pointerReqFifo_V_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_1", "role": "dout" }} , 
 	{ "name": "mq_pointerReqFifo_V_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_1", "role": "empty_n" }} , 
 	{ "name": "mq_pointerReqFifo_V_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_1", "role": "read" }} , 
 	{ "name": "mq_pointerReqFifo_V_s_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_s", "role": "dout" }} , 
 	{ "name": "mq_pointerReqFifo_V_s_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_s", "role": "empty_n" }} , 
 	{ "name": "mq_pointerReqFifo_V_s_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerReqFifo_V_s", "role": "read" }} , 
 	{ "name": "mq_pointerRspFifo_V_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_1", "role": "din" }} , 
 	{ "name": "mq_pointerRspFifo_V_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_1", "role": "full_n" }} , 
 	{ "name": "mq_pointerRspFifo_V_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_1", "role": "write" }} , 
 	{ "name": "mq_pointerRspFifo_V_2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_2", "role": "din" }} , 
 	{ "name": "mq_pointerRspFifo_V_2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_2", "role": "full_n" }} , 
 	{ "name": "mq_pointerRspFifo_V_2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_2", "role": "write" }} , 
 	{ "name": "mq_pointerRspFifo_V_s_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_s", "role": "din" }} , 
 	{ "name": "mq_pointerRspFifo_V_s_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_s", "role": "full_n" }} , 
 	{ "name": "mq_pointerRspFifo_V_s_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "mq_pointerRspFifo_V_s", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "mq_pointer_table",
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
			{"Name" : "mq_pointerUpdFifo_V_s", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerUpdFifo_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerUpdFifo_V_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_V_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerUpdFifo_V_4", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerUpdFifo_V_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_lockedKey_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mq_isLocked", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ptr_table_head_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "ptr_table_tail_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "ptr_table_valid", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "mq_pointerReqFifo_V_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerReqFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerReqFifo_V_s", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerReqFifo_V_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_wait", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mq_request_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "mq_pointerRspFifo_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerRspFifo_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerRspFifo_V_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerRspFifo_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "mq_pointerRspFifo_V_s", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "mq_pointerRspFifo_V_s_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ptr_table_head_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ptr_table_tail_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.ptr_table_valid_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	mq_pointer_table {
		mq_pointerUpdFifo_V_s {Type I LastRead 0 FirstWrite -1}
		mq_pointerUpdFifo_V_1 {Type I LastRead 0 FirstWrite -1}
		mq_pointerUpdFifo_V_3 {Type I LastRead 0 FirstWrite -1}
		mq_pointerUpdFifo_V_4 {Type I LastRead 0 FirstWrite -1}
		mq_lockedKey_V {Type IO LastRead -1 FirstWrite -1}
		mq_isLocked {Type IO LastRead -1 FirstWrite -1}
		ptr_table_head_V {Type IO LastRead -1 FirstWrite -1}
		ptr_table_tail_V {Type IO LastRead -1 FirstWrite -1}
		ptr_table_valid {Type IO LastRead -1 FirstWrite -1}
		mq_pointerReqFifo_V_1 {Type I LastRead 1 FirstWrite -1}
		mq_pointerReqFifo_V_s {Type I LastRead 1 FirstWrite -1}
		mq_wait {Type IO LastRead -1 FirstWrite -1}
		mq_request_key_V {Type IO LastRead -1 FirstWrite -1}
		mq_pointerRspFifo_V_1 {Type O LastRead -1 FirstWrite 2}
		mq_pointerRspFifo_V_2 {Type O LastRead -1 FirstWrite 2}
		mq_pointerRspFifo_V_s {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	mq_pointerUpdFifo_V_s { ap_fifo {  { mq_pointerUpdFifo_V_s_dout fifo_data 0 16 }  { mq_pointerUpdFifo_V_s_empty_n fifo_status 0 1 }  { mq_pointerUpdFifo_V_s_read fifo_update 1 1 } } }
	mq_pointerUpdFifo_V_1 { ap_fifo {  { mq_pointerUpdFifo_V_1_dout fifo_data 0 16 }  { mq_pointerUpdFifo_V_1_empty_n fifo_status 0 1 }  { mq_pointerUpdFifo_V_1_read fifo_update 1 1 } } }
	mq_pointerUpdFifo_V_3 { ap_fifo {  { mq_pointerUpdFifo_V_3_dout fifo_data 0 16 }  { mq_pointerUpdFifo_V_3_empty_n fifo_status 0 1 }  { mq_pointerUpdFifo_V_3_read fifo_update 1 1 } } }
	mq_pointerUpdFifo_V_4 { ap_fifo {  { mq_pointerUpdFifo_V_4_dout fifo_data 0 1 }  { mq_pointerUpdFifo_V_4_empty_n fifo_status 0 1 }  { mq_pointerUpdFifo_V_4_read fifo_update 1 1 } } }
	mq_pointerReqFifo_V_1 { ap_fifo {  { mq_pointerReqFifo_V_1_dout fifo_data 0 16 }  { mq_pointerReqFifo_V_1_empty_n fifo_status 0 1 }  { mq_pointerReqFifo_V_1_read fifo_update 1 1 } } }
	mq_pointerReqFifo_V_s { ap_fifo {  { mq_pointerReqFifo_V_s_dout fifo_data 0 1 }  { mq_pointerReqFifo_V_s_empty_n fifo_status 0 1 }  { mq_pointerReqFifo_V_s_read fifo_update 1 1 } } }
	mq_pointerRspFifo_V_1 { ap_fifo {  { mq_pointerRspFifo_V_1_din fifo_data 1 16 }  { mq_pointerRspFifo_V_1_full_n fifo_status 0 1 }  { mq_pointerRspFifo_V_1_write fifo_update 1 1 } } }
	mq_pointerRspFifo_V_2 { ap_fifo {  { mq_pointerRspFifo_V_2_din fifo_data 1 16 }  { mq_pointerRspFifo_V_2_full_n fifo_status 0 1 }  { mq_pointerRspFifo_V_2_write fifo_update 1 1 } } }
	mq_pointerRspFifo_V_s { ap_fifo {  { mq_pointerRspFifo_V_s_din fifo_data 1 1 }  { mq_pointerRspFifo_V_s_full_n fifo_status 0 1 }  { mq_pointerRspFifo_V_s_write fifo_update 1 1 } } }
}
