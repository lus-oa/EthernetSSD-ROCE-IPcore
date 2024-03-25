set moduleName qp_interface
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
set C_modelName {qp_interface}
set C_modelType { void 0 }
set C_modelArgList {
	{ contextIn_V int 144 regular {axi_s 0 volatile  { contextIn_V Data } }  }
	{ qpi2stateTable_upd_r_1 int 68 regular {fifo 1 volatile } {global 1}  }
	{ stateTable2qpi_rsp_V int 123 regular {fifo 0 volatile } {global 0}  }
	{ if2msnTable_init_V int 48 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "contextIn_V", "interface" : "axis", "bitwidth" : 144, "direction" : "READONLY"} , 
 	{ "Name" : "qpi2stateTable_upd_r_1", "interface" : "fifo", "bitwidth" : 68, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2qpi_rsp_V", "interface" : "fifo", "bitwidth" : 123, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "if2msnTable_init_V", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ contextIn_V_TVALID sc_in sc_logic 1 invld 0 } 
	{ stateTable2qpi_rsp_V_dout sc_in sc_lv 123 signal 2 } 
	{ stateTable2qpi_rsp_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ stateTable2qpi_rsp_V_read sc_out sc_logic 1 signal 2 } 
	{ qpi2stateTable_upd_r_1_din sc_out sc_lv 68 signal 1 } 
	{ qpi2stateTable_upd_r_1_full_n sc_in sc_logic 1 signal 1 } 
	{ qpi2stateTable_upd_r_1_write sc_out sc_logic 1 signal 1 } 
	{ if2msnTable_init_V_din sc_out sc_lv 48 signal 3 } 
	{ if2msnTable_init_V_full_n sc_in sc_logic 1 signal 3 } 
	{ if2msnTable_init_V_write sc_out sc_logic 1 signal 3 } 
	{ contextIn_V_TDATA sc_in sc_lv 144 signal 0 } 
	{ contextIn_V_TREADY sc_out sc_logic 1 inacc 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "contextIn_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "contextIn_V", "role": "TVALID" }} , 
 	{ "name": "stateTable2qpi_rsp_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":123, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp_V", "role": "dout" }} , 
 	{ "name": "stateTable2qpi_rsp_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp_V", "role": "empty_n" }} , 
 	{ "name": "stateTable2qpi_rsp_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp_V", "role": "read" }} , 
 	{ "name": "qpi2stateTable_upd_r_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":68, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_r_1", "role": "din" }} , 
 	{ "name": "qpi2stateTable_upd_r_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_r_1", "role": "full_n" }} , 
 	{ "name": "qpi2stateTable_upd_r_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_r_1", "role": "write" }} , 
 	{ "name": "if2msnTable_init_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "if2msnTable_init_V", "role": "din" }} , 
 	{ "name": "if2msnTable_init_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "if2msnTable_init_V", "role": "full_n" }} , 
 	{ "name": "if2msnTable_init_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "if2msnTable_init_V", "role": "write" }} , 
 	{ "name": "contextIn_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":144, "type": "signal", "bundle":{"name": "contextIn_V", "role": "TDATA" }} , 
 	{ "name": "contextIn_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "contextIn_V", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "qp_interface",
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
			{"Name" : "contextIn_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "contextIn_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "qp_fsmState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_newState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_qp_num_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_remote_psn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_local_psn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "context_r_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "qpi2stateTable_upd_r_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "qpi2stateTable_upd_r_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateTable2qpi_rsp_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2qpi_rsp_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "if2msnTable_init_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "if2msnTable_init_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	qp_interface {
		contextIn_V {Type I LastRead 0 FirstWrite -1}
		qp_fsmState {Type IO LastRead -1 FirstWrite -1}
		context_newState {Type IO LastRead -1 FirstWrite -1}
		context_qp_num_V {Type IO LastRead -1 FirstWrite -1}
		context_remote_psn_V {Type IO LastRead -1 FirstWrite -1}
		context_local_psn_V {Type IO LastRead -1 FirstWrite -1}
		context_r_key_V {Type IO LastRead -1 FirstWrite -1}
		qpi2stateTable_upd_r_1 {Type O LastRead -1 FirstWrite 1}
		stateTable2qpi_rsp_V {Type I LastRead 0 FirstWrite -1}
		if2msnTable_init_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	contextIn_V { axis {  { contextIn_V_TVALID in_vld 0 1 }  { contextIn_V_TDATA in_data 0 144 }  { contextIn_V_TREADY in_acc 1 1 } } }
	qpi2stateTable_upd_r_1 { ap_fifo {  { qpi2stateTable_upd_r_1_din fifo_data 1 68 }  { qpi2stateTable_upd_r_1_full_n fifo_status 0 1 }  { qpi2stateTable_upd_r_1_write fifo_update 1 1 } } }
	stateTable2qpi_rsp_V { ap_fifo {  { stateTable2qpi_rsp_V_dout fifo_data 0 123 }  { stateTable2qpi_rsp_V_empty_n fifo_status 0 1 }  { stateTable2qpi_rsp_V_read fifo_update 1 1 } } }
	if2msnTable_init_V { ap_fifo {  { if2msnTable_init_V_din fifo_data 1 48 }  { if2msnTable_init_V_full_n fifo_status 0 1 }  { if2msnTable_init_V_write fifo_update 1 1 } } }
}
