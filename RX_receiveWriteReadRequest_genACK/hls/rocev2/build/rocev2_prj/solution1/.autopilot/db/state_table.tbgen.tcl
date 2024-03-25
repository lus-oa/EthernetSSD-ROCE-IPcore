set moduleName state_table
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
set C_modelName {state_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ rxIbh2stateTable_upd_1 int 45 regular {fifo 0 volatile } {global 0}  }
	{ stateTable2rxIbh_rsp_1 int 75 regular {fifo 1 volatile } {global 1}  }
	{ txIbh2stateTable_upd_1 int 41 regular {fifo 0 volatile } {global 0}  }
	{ stateTable2txIbh_rsp_1 int 123 regular {fifo 1 volatile } {global 1}  }
	{ qpi2stateTable_upd_r_1 int 68 regular {fifo 0 volatile } {global 0}  }
	{ stateTable2qpi_rsp_V int 123 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "rxIbh2stateTable_upd_1", "interface" : "fifo", "bitwidth" : 45, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2rxIbh_rsp_1", "interface" : "fifo", "bitwidth" : 75, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "txIbh2stateTable_upd_1", "interface" : "fifo", "bitwidth" : 41, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2txIbh_rsp_1", "interface" : "fifo", "bitwidth" : 123, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "qpi2stateTable_upd_r_1", "interface" : "fifo", "bitwidth" : 68, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2qpi_rsp_V", "interface" : "fifo", "bitwidth" : 123, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rxIbh2stateTable_upd_1_dout sc_in sc_lv 45 signal 0 } 
	{ rxIbh2stateTable_upd_1_empty_n sc_in sc_logic 1 signal 0 } 
	{ rxIbh2stateTable_upd_1_read sc_out sc_logic 1 signal 0 } 
	{ txIbh2stateTable_upd_1_dout sc_in sc_lv 41 signal 2 } 
	{ txIbh2stateTable_upd_1_empty_n sc_in sc_logic 1 signal 2 } 
	{ txIbh2stateTable_upd_1_read sc_out sc_logic 1 signal 2 } 
	{ qpi2stateTable_upd_r_1_dout sc_in sc_lv 68 signal 4 } 
	{ qpi2stateTable_upd_r_1_empty_n sc_in sc_logic 1 signal 4 } 
	{ qpi2stateTable_upd_r_1_read sc_out sc_logic 1 signal 4 } 
	{ stateTable2qpi_rsp_V_din sc_out sc_lv 123 signal 5 } 
	{ stateTable2qpi_rsp_V_full_n sc_in sc_logic 1 signal 5 } 
	{ stateTable2qpi_rsp_V_write sc_out sc_logic 1 signal 5 } 
	{ stateTable2txIbh_rsp_1_din sc_out sc_lv 123 signal 3 } 
	{ stateTable2txIbh_rsp_1_full_n sc_in sc_logic 1 signal 3 } 
	{ stateTable2txIbh_rsp_1_write sc_out sc_logic 1 signal 3 } 
	{ stateTable2rxIbh_rsp_1_din sc_out sc_lv 75 signal 1 } 
	{ stateTable2rxIbh_rsp_1_full_n sc_in sc_logic 1 signal 1 } 
	{ stateTable2rxIbh_rsp_1_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rxIbh2stateTable_upd_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":45, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_1", "role": "dout" }} , 
 	{ "name": "rxIbh2stateTable_upd_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_1", "role": "empty_n" }} , 
 	{ "name": "rxIbh2stateTable_upd_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_1", "role": "read" }} , 
 	{ "name": "txIbh2stateTable_upd_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":41, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_1", "role": "dout" }} , 
 	{ "name": "txIbh2stateTable_upd_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_1", "role": "empty_n" }} , 
 	{ "name": "txIbh2stateTable_upd_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txIbh2stateTable_upd_1", "role": "read" }} , 
 	{ "name": "qpi2stateTable_upd_r_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":68, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_r_1", "role": "dout" }} , 
 	{ "name": "qpi2stateTable_upd_r_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_r_1", "role": "empty_n" }} , 
 	{ "name": "qpi2stateTable_upd_r_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "qpi2stateTable_upd_r_1", "role": "read" }} , 
 	{ "name": "stateTable2qpi_rsp_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":123, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp_V", "role": "din" }} , 
 	{ "name": "stateTable2qpi_rsp_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp_V", "role": "full_n" }} , 
 	{ "name": "stateTable2qpi_rsp_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2qpi_rsp_V", "role": "write" }} , 
 	{ "name": "stateTable2txIbh_rsp_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":123, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp_1", "role": "din" }} , 
 	{ "name": "stateTable2txIbh_rsp_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp_1", "role": "full_n" }} , 
 	{ "name": "stateTable2txIbh_rsp_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2txIbh_rsp_1", "role": "write" }} , 
 	{ "name": "stateTable2rxIbh_rsp_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":75, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp_1", "role": "din" }} , 
 	{ "name": "stateTable2rxIbh_rsp_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp_1", "role": "full_n" }} , 
 	{ "name": "stateTable2rxIbh_rsp_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp_1", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6"],
		"CDFG" : "state_table",
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
			{"Name" : "rxIbh2stateTable_upd_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rxIbh2stateTable_upd_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "state_table_req_old_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_resp_eps", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_retryCou", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_resp_old", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_req_next", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "state_table_req_old_s", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "stateTable2rxIbh_rsp_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2rxIbh_rsp_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "txIbh2stateTable_upd_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "txIbh2stateTable_upd_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateTable2txIbh_rsp_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2txIbh_rsp_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "qpi2stateTable_upd_r_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "qpi2stateTable_upd_r_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateTable2qpi_rsp_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2qpi_rsp_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_req_old_1_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_resp_eps_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_retryCou_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_resp_old_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_req_next_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.state_table_req_old_s_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	state_table {
		rxIbh2stateTable_upd_1 {Type I LastRead 0 FirstWrite -1}
		state_table_req_old_1 {Type IO LastRead -1 FirstWrite -1}
		state_table_resp_eps {Type IO LastRead -1 FirstWrite -1}
		state_table_retryCou {Type IO LastRead -1 FirstWrite -1}
		state_table_resp_old {Type IO LastRead -1 FirstWrite -1}
		state_table_req_next {Type IO LastRead -1 FirstWrite -1}
		state_table_req_old_s {Type IO LastRead -1 FirstWrite -1}
		stateTable2rxIbh_rsp_1 {Type O LastRead -1 FirstWrite 3}
		txIbh2stateTable_upd_1 {Type I LastRead 1 FirstWrite -1}
		stateTable2txIbh_rsp_1 {Type O LastRead -1 FirstWrite 3}
		qpi2stateTable_upd_r_1 {Type I LastRead 2 FirstWrite -1}
		stateTable2qpi_rsp_V {Type O LastRead -1 FirstWrite 3}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "3", "Max" : "3"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	rxIbh2stateTable_upd_1 { ap_fifo {  { rxIbh2stateTable_upd_1_dout fifo_data 0 45 }  { rxIbh2stateTable_upd_1_empty_n fifo_status 0 1 }  { rxIbh2stateTable_upd_1_read fifo_update 1 1 } } }
	stateTable2rxIbh_rsp_1 { ap_fifo {  { stateTable2rxIbh_rsp_1_din fifo_data 1 75 }  { stateTable2rxIbh_rsp_1_full_n fifo_status 0 1 }  { stateTable2rxIbh_rsp_1_write fifo_update 1 1 } } }
	txIbh2stateTable_upd_1 { ap_fifo {  { txIbh2stateTable_upd_1_dout fifo_data 0 41 }  { txIbh2stateTable_upd_1_empty_n fifo_status 0 1 }  { txIbh2stateTable_upd_1_read fifo_update 1 1 } } }
	stateTable2txIbh_rsp_1 { ap_fifo {  { stateTable2txIbh_rsp_1_din fifo_data 1 123 }  { stateTable2txIbh_rsp_1_full_n fifo_status 0 1 }  { stateTable2txIbh_rsp_1_write fifo_update 1 1 } } }
	qpi2stateTable_upd_r_1 { ap_fifo {  { qpi2stateTable_upd_r_1_dout fifo_data 0 68 }  { qpi2stateTable_upd_r_1_empty_n fifo_status 0 1 }  { qpi2stateTable_upd_r_1_read fifo_update 1 1 } } }
	stateTable2qpi_rsp_V { ap_fifo {  { stateTable2qpi_rsp_V_din fifo_data 1 123 }  { stateTable2qpi_rsp_V_full_n fifo_status 0 1 }  { stateTable2qpi_rsp_V_write fifo_update 1 1 } } }
}
