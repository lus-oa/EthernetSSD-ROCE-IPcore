set moduleName local_req_handler
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
set C_modelName {local_req_handler}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_tx_meta_V int 160 regular {axi_s 0 volatile  { s_axis_tx_meta_V Data } }  }
	{ tx_appMetaFifo_V_op_s int 5 regular {fifo 1 volatile } {global 1}  }
	{ tx_appMetaFifo_V_qpn int 24 regular {fifo 1 volatile } {global 1}  }
	{ tx_appMetaFifo_V_add int 48 regular {fifo 1 volatile } {global 1}  }
	{ tx_appMetaFifo_V_len int 32 regular {fifo 1 volatile } {global 1}  }
	{ tx_appMetaFifo_V_psn int 24 regular {fifo 1 volatile } {global 1}  }
	{ tx_appMetaFifo_V_val int 1 regular {fifo 1 volatile } {global 1}  }
	{ tx_appMetaFifo_V_isN int 1 regular {fifo 1 volatile } {global 1}  }
	{ tx_readReqAddr_push_1_1 int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_readReqAddr_push_s_2 int 64 regular {fifo 1 volatile } {global 1}  }
	{ tx_localMemCmdFifo_V int 113 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_tx_meta_V", "interface" : "axis", "bitwidth" : 160, "direction" : "READONLY"} , 
 	{ "Name" : "tx_appMetaFifo_V_op_s", "interface" : "fifo", "bitwidth" : 5, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_qpn", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_add", "interface" : "fifo", "bitwidth" : 48, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_len", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_psn", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_val", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_appMetaFifo_V_isN", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_readReqAddr_push_1_1", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_readReqAddr_push_s_2", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_localMemCmdFifo_V", "interface" : "fifo", "bitwidth" : 113, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ s_axis_tx_meta_V_TVALID sc_in sc_logic 1 invld 0 } 
	{ tx_localMemCmdFifo_V_din sc_out sc_lv 113 signal 10 } 
	{ tx_localMemCmdFifo_V_full_n sc_in sc_logic 1 signal 10 } 
	{ tx_localMemCmdFifo_V_write sc_out sc_logic 1 signal 10 } 
	{ tx_appMetaFifo_V_op_s_din sc_out sc_lv 5 signal 1 } 
	{ tx_appMetaFifo_V_op_s_full_n sc_in sc_logic 1 signal 1 } 
	{ tx_appMetaFifo_V_op_s_write sc_out sc_logic 1 signal 1 } 
	{ tx_appMetaFifo_V_qpn_din sc_out sc_lv 24 signal 2 } 
	{ tx_appMetaFifo_V_qpn_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_appMetaFifo_V_qpn_write sc_out sc_logic 1 signal 2 } 
	{ tx_appMetaFifo_V_add_din sc_out sc_lv 48 signal 3 } 
	{ tx_appMetaFifo_V_add_full_n sc_in sc_logic 1 signal 3 } 
	{ tx_appMetaFifo_V_add_write sc_out sc_logic 1 signal 3 } 
	{ tx_appMetaFifo_V_len_din sc_out sc_lv 32 signal 4 } 
	{ tx_appMetaFifo_V_len_full_n sc_in sc_logic 1 signal 4 } 
	{ tx_appMetaFifo_V_len_write sc_out sc_logic 1 signal 4 } 
	{ tx_appMetaFifo_V_psn_din sc_out sc_lv 24 signal 5 } 
	{ tx_appMetaFifo_V_psn_full_n sc_in sc_logic 1 signal 5 } 
	{ tx_appMetaFifo_V_psn_write sc_out sc_logic 1 signal 5 } 
	{ tx_appMetaFifo_V_val_din sc_out sc_lv 1 signal 6 } 
	{ tx_appMetaFifo_V_val_full_n sc_in sc_logic 1 signal 6 } 
	{ tx_appMetaFifo_V_val_write sc_out sc_logic 1 signal 6 } 
	{ tx_appMetaFifo_V_isN_din sc_out sc_lv 1 signal 7 } 
	{ tx_appMetaFifo_V_isN_full_n sc_in sc_logic 1 signal 7 } 
	{ tx_appMetaFifo_V_isN_write sc_out sc_logic 1 signal 7 } 
	{ tx_readReqAddr_push_1_1_din sc_out sc_lv 16 signal 8 } 
	{ tx_readReqAddr_push_1_1_full_n sc_in sc_logic 1 signal 8 } 
	{ tx_readReqAddr_push_1_1_write sc_out sc_logic 1 signal 8 } 
	{ tx_readReqAddr_push_s_2_din sc_out sc_lv 64 signal 9 } 
	{ tx_readReqAddr_push_s_2_full_n sc_in sc_logic 1 signal 9 } 
	{ tx_readReqAddr_push_s_2_write sc_out sc_logic 1 signal 9 } 
	{ s_axis_tx_meta_V_TDATA sc_in sc_lv 160 signal 0 } 
	{ s_axis_tx_meta_V_TREADY sc_out sc_logic 1 inacc 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_tx_meta_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_tx_meta_V", "role": "TVALID" }} , 
 	{ "name": "tx_localMemCmdFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":113, "type": "signal", "bundle":{"name": "tx_localMemCmdFifo_V", "role": "din" }} , 
 	{ "name": "tx_localMemCmdFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_localMemCmdFifo_V", "role": "full_n" }} , 
 	{ "name": "tx_localMemCmdFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_localMemCmdFifo_V", "role": "write" }} , 
 	{ "name": "tx_appMetaFifo_V_op_s_din", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_op_s", "role": "din" }} , 
 	{ "name": "tx_appMetaFifo_V_op_s_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_op_s", "role": "full_n" }} , 
 	{ "name": "tx_appMetaFifo_V_op_s_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_op_s", "role": "write" }} , 
 	{ "name": "tx_appMetaFifo_V_qpn_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_qpn", "role": "din" }} , 
 	{ "name": "tx_appMetaFifo_V_qpn_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_qpn", "role": "full_n" }} , 
 	{ "name": "tx_appMetaFifo_V_qpn_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_qpn", "role": "write" }} , 
 	{ "name": "tx_appMetaFifo_V_add_din", "direction": "out", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_add", "role": "din" }} , 
 	{ "name": "tx_appMetaFifo_V_add_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_add", "role": "full_n" }} , 
 	{ "name": "tx_appMetaFifo_V_add_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_add", "role": "write" }} , 
 	{ "name": "tx_appMetaFifo_V_len_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_len", "role": "din" }} , 
 	{ "name": "tx_appMetaFifo_V_len_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_len", "role": "full_n" }} , 
 	{ "name": "tx_appMetaFifo_V_len_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_len", "role": "write" }} , 
 	{ "name": "tx_appMetaFifo_V_psn_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_psn", "role": "din" }} , 
 	{ "name": "tx_appMetaFifo_V_psn_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_psn", "role": "full_n" }} , 
 	{ "name": "tx_appMetaFifo_V_psn_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_psn", "role": "write" }} , 
 	{ "name": "tx_appMetaFifo_V_val_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_val", "role": "din" }} , 
 	{ "name": "tx_appMetaFifo_V_val_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_val", "role": "full_n" }} , 
 	{ "name": "tx_appMetaFifo_V_val_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_val", "role": "write" }} , 
 	{ "name": "tx_appMetaFifo_V_isN_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_isN", "role": "din" }} , 
 	{ "name": "tx_appMetaFifo_V_isN_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_isN", "role": "full_n" }} , 
 	{ "name": "tx_appMetaFifo_V_isN_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_appMetaFifo_V_isN", "role": "write" }} , 
 	{ "name": "tx_readReqAddr_push_1_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_1_1", "role": "din" }} , 
 	{ "name": "tx_readReqAddr_push_1_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_1_1", "role": "full_n" }} , 
 	{ "name": "tx_readReqAddr_push_1_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_1_1", "role": "write" }} , 
 	{ "name": "tx_readReqAddr_push_s_2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_s_2", "role": "din" }} , 
 	{ "name": "tx_readReqAddr_push_s_2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_s_2", "role": "full_n" }} , 
 	{ "name": "tx_readReqAddr_push_s_2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqAddr_push_s_2", "role": "write" }} , 
 	{ "name": "s_axis_tx_meta_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":160, "type": "signal", "bundle":{"name": "s_axis_tx_meta_V", "role": "TDATA" }} , 
 	{ "name": "s_axis_tx_meta_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_tx_meta_V", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "local_req_handler",
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
			{"Name" : "s_axis_tx_meta_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_tx_meta_V_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "lrh_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_op_code", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_local_vaddr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_remote_vaddr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_length_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_qpn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_appMetaFifo_V_op_s", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_op_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_qpn", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_qpn_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_add", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_add_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_len", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_len_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_psn", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_psn_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_val", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_appMetaFifo_V_isN", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_appMetaFifo_V_isN_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_readReqAddr_push_1_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqAddr_push_1_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_readReqAddr_push_s_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqAddr_push_s_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_localMemCmdFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_localMemCmdFifo_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	local_req_handler {
		s_axis_tx_meta_V {Type I LastRead 0 FirstWrite -1}
		lrh_state {Type IO LastRead -1 FirstWrite -1}
		meta_op_code {Type IO LastRead -1 FirstWrite -1}
		meta_local_vaddr_V {Type IO LastRead -1 FirstWrite -1}
		meta_remote_vaddr_V {Type IO LastRead -1 FirstWrite -1}
		meta_length_V {Type IO LastRead -1 FirstWrite -1}
		meta_qpn_V {Type IO LastRead -1 FirstWrite -1}
		tx_appMetaFifo_V_op_s {Type O LastRead -1 FirstWrite 1}
		tx_appMetaFifo_V_qpn {Type O LastRead -1 FirstWrite 1}
		tx_appMetaFifo_V_add {Type O LastRead -1 FirstWrite 1}
		tx_appMetaFifo_V_len {Type O LastRead -1 FirstWrite 1}
		tx_appMetaFifo_V_psn {Type O LastRead -1 FirstWrite 1}
		tx_appMetaFifo_V_val {Type O LastRead -1 FirstWrite 1}
		tx_appMetaFifo_V_isN {Type O LastRead -1 FirstWrite 1}
		tx_readReqAddr_push_1_1 {Type O LastRead -1 FirstWrite 1}
		tx_readReqAddr_push_s_2 {Type O LastRead -1 FirstWrite 1}
		tx_localMemCmdFifo_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_tx_meta_V { axis {  { s_axis_tx_meta_V_TVALID in_vld 0 1 }  { s_axis_tx_meta_V_TDATA in_data 0 160 }  { s_axis_tx_meta_V_TREADY in_acc 1 1 } } }
	tx_appMetaFifo_V_op_s { ap_fifo {  { tx_appMetaFifo_V_op_s_din fifo_data 1 5 }  { tx_appMetaFifo_V_op_s_full_n fifo_status 0 1 }  { tx_appMetaFifo_V_op_s_write fifo_update 1 1 } } }
	tx_appMetaFifo_V_qpn { ap_fifo {  { tx_appMetaFifo_V_qpn_din fifo_data 1 24 }  { tx_appMetaFifo_V_qpn_full_n fifo_status 0 1 }  { tx_appMetaFifo_V_qpn_write fifo_update 1 1 } } }
	tx_appMetaFifo_V_add { ap_fifo {  { tx_appMetaFifo_V_add_din fifo_data 1 48 }  { tx_appMetaFifo_V_add_full_n fifo_status 0 1 }  { tx_appMetaFifo_V_add_write fifo_update 1 1 } } }
	tx_appMetaFifo_V_len { ap_fifo {  { tx_appMetaFifo_V_len_din fifo_data 1 32 }  { tx_appMetaFifo_V_len_full_n fifo_status 0 1 }  { tx_appMetaFifo_V_len_write fifo_update 1 1 } } }
	tx_appMetaFifo_V_psn { ap_fifo {  { tx_appMetaFifo_V_psn_din fifo_data 1 24 }  { tx_appMetaFifo_V_psn_full_n fifo_status 0 1 }  { tx_appMetaFifo_V_psn_write fifo_update 1 1 } } }
	tx_appMetaFifo_V_val { ap_fifo {  { tx_appMetaFifo_V_val_din fifo_data 1 1 }  { tx_appMetaFifo_V_val_full_n fifo_status 0 1 }  { tx_appMetaFifo_V_val_write fifo_update 1 1 } } }
	tx_appMetaFifo_V_isN { ap_fifo {  { tx_appMetaFifo_V_isN_din fifo_data 1 1 }  { tx_appMetaFifo_V_isN_full_n fifo_status 0 1 }  { tx_appMetaFifo_V_isN_write fifo_update 1 1 } } }
	tx_readReqAddr_push_1_1 { ap_fifo {  { tx_readReqAddr_push_1_1_din fifo_data 1 16 }  { tx_readReqAddr_push_1_1_full_n fifo_status 0 1 }  { tx_readReqAddr_push_1_1_write fifo_update 1 1 } } }
	tx_readReqAddr_push_s_2 { ap_fifo {  { tx_readReqAddr_push_s_2_din fifo_data 1 64 }  { tx_readReqAddr_push_s_2_full_n fifo_status 0 1 }  { tx_readReqAddr_push_s_2_write fifo_update 1 1 } } }
	tx_localMemCmdFifo_V { ap_fifo {  { tx_localMemCmdFifo_V_din fifo_data 1 113 }  { tx_localMemCmdFifo_V_full_n fifo_status 0 1 }  { tx_localMemCmdFifo_V_write fifo_update 1 1 } } }
}
