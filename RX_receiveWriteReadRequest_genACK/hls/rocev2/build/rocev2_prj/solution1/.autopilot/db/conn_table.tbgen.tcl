set moduleName conn_table
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
set C_modelName {conn_table}
set C_modelType { void 0 }
set C_modelArgList {
	{ qpi2connTable_req_V int 184 regular {axi_s 0 volatile  { qpi2connTable_req_V Data } }  }
	{ tx_ibhconnTable_req_s_3 int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_connTable2ibh_rsp_1 int 168 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "qpi2connTable_req_V", "interface" : "axis", "bitwidth" : 184, "direction" : "READONLY"} , 
 	{ "Name" : "tx_ibhconnTable_req_s_3", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_connTable2ibh_rsp_1", "interface" : "fifo", "bitwidth" : 168, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 16
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ qpi2connTable_req_V_TVALID sc_in sc_logic 1 invld 0 } 
	{ tx_ibhconnTable_req_s_3_dout sc_in sc_lv 16 signal 1 } 
	{ tx_ibhconnTable_req_s_3_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_ibhconnTable_req_s_3_read sc_out sc_logic 1 signal 1 } 
	{ tx_connTable2ibh_rsp_1_din sc_out sc_lv 168 signal 2 } 
	{ tx_connTable2ibh_rsp_1_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_connTable2ibh_rsp_1_write sc_out sc_logic 1 signal 2 } 
	{ qpi2connTable_req_V_TDATA sc_in sc_lv 184 signal 0 } 
	{ qpi2connTable_req_V_TREADY sc_out sc_logic 1 inacc 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "qpi2connTable_req_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "qpi2connTable_req_V", "role": "TVALID" }} , 
 	{ "name": "tx_ibhconnTable_req_s_3_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req_s_3", "role": "dout" }} , 
 	{ "name": "tx_ibhconnTable_req_s_3_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req_s_3", "role": "empty_n" }} , 
 	{ "name": "tx_ibhconnTable_req_s_3_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ibhconnTable_req_s_3", "role": "read" }} , 
 	{ "name": "tx_connTable2ibh_rsp_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":168, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp_1", "role": "din" }} , 
 	{ "name": "tx_connTable2ibh_rsp_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp_1", "role": "full_n" }} , 
 	{ "name": "tx_connTable2ibh_rsp_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp_1", "role": "write" }} , 
 	{ "name": "qpi2connTable_req_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":184, "type": "signal", "bundle":{"name": "qpi2connTable_req_V", "role": "TDATA" }} , 
 	{ "name": "qpi2connTable_req_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "qpi2connTable_req_V", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3"],
		"CDFG" : "conn_table",
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
			{"Name" : "qpi2connTable_req_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "qpi2connTable_req_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ibhconnTable_req_s_3", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ibhconnTable_req_s_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "conn_table_remote_qp", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "conn_table_remote_ip", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "conn_table_remote_ud", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "tx_connTable2ibh_rsp_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_connTable2ibh_rsp_1_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conn_table_remote_qp_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conn_table_remote_ip_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.conn_table_remote_ud_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	conn_table {
		qpi2connTable_req_V {Type I LastRead 0 FirstWrite -1}
		tx_ibhconnTable_req_s_3 {Type I LastRead 0 FirstWrite -1}
		conn_table_remote_qp {Type IO LastRead -1 FirstWrite -1}
		conn_table_remote_ip {Type IO LastRead -1 FirstWrite -1}
		conn_table_remote_ud {Type IO LastRead -1 FirstWrite -1}
		tx_connTable2ibh_rsp_1 {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	qpi2connTable_req_V { axis {  { qpi2connTable_req_V_TVALID in_vld 0 1 }  { qpi2connTable_req_V_TDATA in_data 0 184 }  { qpi2connTable_req_V_TREADY in_acc 1 1 } } }
	tx_ibhconnTable_req_s_3 { ap_fifo {  { tx_ibhconnTable_req_s_3_dout fifo_data 0 16 }  { tx_ibhconnTable_req_s_3_empty_n fifo_status 0 1 }  { tx_ibhconnTable_req_s_3_read fifo_update 1 1 } } }
	tx_connTable2ibh_rsp_1 { ap_fifo {  { tx_connTable2ibh_rsp_1_din fifo_data 1 168 }  { tx_connTable2ibh_rsp_1_full_n fifo_status 0 1 }  { tx_connTable2ibh_rsp_1_write fifo_update 1 1 } } }
}
