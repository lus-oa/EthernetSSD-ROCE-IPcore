set moduleName generate_udp_512_s
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
set C_modelName {generate_udp<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_udpMetaFifo_V_the int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_udpMetaFifo_V_my_s int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_udpMetaFifo_V_len int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_udpMetaFifo_V_val int 1 regular {fifo 0 volatile } {global 0}  }
	{ tx_shift2udpFifo_V_d int 512 regular {fifo 0 volatile } {global 0}  }
	{ tx_shift2udpFifo_V_k int 64 regular {fifo 0 volatile } {global 0}  }
	{ tx_shift2udpFifo_V_l int 1 regular {fifo 0 volatile } {global 0}  }
	{ tx_udp2ipFifo_V_data int 512 regular {fifo 1 volatile } {global 1}  }
	{ tx_udp2ipFifo_V_keep int 64 regular {fifo 1 volatile } {global 1}  }
	{ tx_udp2ipFifo_V_last int 1 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_udpMetaFifo_V_the", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_udpMetaFifo_V_my_s", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_udpMetaFifo_V_len", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_udpMetaFifo_V_val", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_shift2udpFifo_V_d", "interface" : "fifo", "bitwidth" : 512, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_shift2udpFifo_V_k", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_shift2udpFifo_V_l", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_udp2ipFifo_V_data", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_udp2ipFifo_V_keep", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_udp2ipFifo_V_last", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 37
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tx_shift2udpFifo_V_d_dout sc_in sc_lv 512 signal 4 } 
	{ tx_shift2udpFifo_V_d_empty_n sc_in sc_logic 1 signal 4 } 
	{ tx_shift2udpFifo_V_d_read sc_out sc_logic 1 signal 4 } 
	{ tx_shift2udpFifo_V_k_dout sc_in sc_lv 64 signal 5 } 
	{ tx_shift2udpFifo_V_k_empty_n sc_in sc_logic 1 signal 5 } 
	{ tx_shift2udpFifo_V_k_read sc_out sc_logic 1 signal 5 } 
	{ tx_shift2udpFifo_V_l_dout sc_in sc_lv 1 signal 6 } 
	{ tx_shift2udpFifo_V_l_empty_n sc_in sc_logic 1 signal 6 } 
	{ tx_shift2udpFifo_V_l_read sc_out sc_logic 1 signal 6 } 
	{ tx_udpMetaFifo_V_the_dout sc_in sc_lv 16 signal 0 } 
	{ tx_udpMetaFifo_V_the_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_udpMetaFifo_V_the_read sc_out sc_logic 1 signal 0 } 
	{ tx_udpMetaFifo_V_my_s_dout sc_in sc_lv 16 signal 1 } 
	{ tx_udpMetaFifo_V_my_s_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_udpMetaFifo_V_my_s_read sc_out sc_logic 1 signal 1 } 
	{ tx_udpMetaFifo_V_len_dout sc_in sc_lv 16 signal 2 } 
	{ tx_udpMetaFifo_V_len_empty_n sc_in sc_logic 1 signal 2 } 
	{ tx_udpMetaFifo_V_len_read sc_out sc_logic 1 signal 2 } 
	{ tx_udpMetaFifo_V_val_dout sc_in sc_lv 1 signal 3 } 
	{ tx_udpMetaFifo_V_val_empty_n sc_in sc_logic 1 signal 3 } 
	{ tx_udpMetaFifo_V_val_read sc_out sc_logic 1 signal 3 } 
	{ tx_udp2ipFifo_V_data_din sc_out sc_lv 512 signal 7 } 
	{ tx_udp2ipFifo_V_data_full_n sc_in sc_logic 1 signal 7 } 
	{ tx_udp2ipFifo_V_data_write sc_out sc_logic 1 signal 7 } 
	{ tx_udp2ipFifo_V_keep_din sc_out sc_lv 64 signal 8 } 
	{ tx_udp2ipFifo_V_keep_full_n sc_in sc_logic 1 signal 8 } 
	{ tx_udp2ipFifo_V_keep_write sc_out sc_logic 1 signal 8 } 
	{ tx_udp2ipFifo_V_last_din sc_out sc_lv 1 signal 9 } 
	{ tx_udp2ipFifo_V_last_full_n sc_in sc_logic 1 signal 9 } 
	{ tx_udp2ipFifo_V_last_write sc_out sc_logic 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_shift2udpFifo_V_d_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_shift2udpFifo_V_d", "role": "dout" }} , 
 	{ "name": "tx_shift2udpFifo_V_d_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2udpFifo_V_d", "role": "empty_n" }} , 
 	{ "name": "tx_shift2udpFifo_V_d_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2udpFifo_V_d", "role": "read" }} , 
 	{ "name": "tx_shift2udpFifo_V_k_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_shift2udpFifo_V_k", "role": "dout" }} , 
 	{ "name": "tx_shift2udpFifo_V_k_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2udpFifo_V_k", "role": "empty_n" }} , 
 	{ "name": "tx_shift2udpFifo_V_k_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2udpFifo_V_k", "role": "read" }} , 
 	{ "name": "tx_shift2udpFifo_V_l_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2udpFifo_V_l", "role": "dout" }} , 
 	{ "name": "tx_shift2udpFifo_V_l_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2udpFifo_V_l", "role": "empty_n" }} , 
 	{ "name": "tx_shift2udpFifo_V_l_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_shift2udpFifo_V_l", "role": "read" }} , 
 	{ "name": "tx_udpMetaFifo_V_the_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_the", "role": "dout" }} , 
 	{ "name": "tx_udpMetaFifo_V_the_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_the", "role": "empty_n" }} , 
 	{ "name": "tx_udpMetaFifo_V_the_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_the", "role": "read" }} , 
 	{ "name": "tx_udpMetaFifo_V_my_s_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_my_s", "role": "dout" }} , 
 	{ "name": "tx_udpMetaFifo_V_my_s_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_my_s", "role": "empty_n" }} , 
 	{ "name": "tx_udpMetaFifo_V_my_s_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_my_s", "role": "read" }} , 
 	{ "name": "tx_udpMetaFifo_V_len_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_len", "role": "dout" }} , 
 	{ "name": "tx_udpMetaFifo_V_len_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_len", "role": "empty_n" }} , 
 	{ "name": "tx_udpMetaFifo_V_len_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_len", "role": "read" }} , 
 	{ "name": "tx_udpMetaFifo_V_val_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_val", "role": "dout" }} , 
 	{ "name": "tx_udpMetaFifo_V_val_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_val", "role": "empty_n" }} , 
 	{ "name": "tx_udpMetaFifo_V_val_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udpMetaFifo_V_val", "role": "read" }} , 
 	{ "name": "tx_udp2ipFifo_V_data_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_udp2ipFifo_V_data", "role": "din" }} , 
 	{ "name": "tx_udp2ipFifo_V_data_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipFifo_V_data", "role": "full_n" }} , 
 	{ "name": "tx_udp2ipFifo_V_data_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipFifo_V_data", "role": "write" }} , 
 	{ "name": "tx_udp2ipFifo_V_keep_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_udp2ipFifo_V_keep", "role": "din" }} , 
 	{ "name": "tx_udp2ipFifo_V_keep_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipFifo_V_keep", "role": "full_n" }} , 
 	{ "name": "tx_udp2ipFifo_V_keep_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipFifo_V_keep", "role": "write" }} , 
 	{ "name": "tx_udp2ipFifo_V_last_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipFifo_V_last", "role": "din" }} , 
 	{ "name": "tx_udp2ipFifo_V_last_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipFifo_V_last", "role": "full_n" }} , 
 	{ "name": "tx_udp2ipFifo_V_last_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_udp2ipFifo_V_last", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "generate_udp_512_s",
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
			{"Name" : "state_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "header_idx_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_udpMetaFifo_V_the", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_V_the_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udpMetaFifo_V_my_s", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_V_my_s_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udpMetaFifo_V_len", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_V_len_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udpMetaFifo_V_val", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udpMetaFifo_V_val_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "header_header_V_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_shift2udpFifo_V_d", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2udpFifo_V_d_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_shift2udpFifo_V_k", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2udpFifo_V_k_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_shift2udpFifo_V_l", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_shift2udpFifo_V_l_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udp2ipFifo_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udp2ipFifo_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udp2ipFifo_V_keep", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udp2ipFifo_V_keep_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_udp2ipFifo_V_last", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_udp2ipFifo_V_last_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	generate_udp_512_s {
		state_4 {Type IO LastRead -1 FirstWrite -1}
		header_idx_5 {Type IO LastRead -1 FirstWrite -1}
		tx_udpMetaFifo_V_the {Type I LastRead 0 FirstWrite -1}
		tx_udpMetaFifo_V_my_s {Type I LastRead 0 FirstWrite -1}
		tx_udpMetaFifo_V_len {Type I LastRead 0 FirstWrite -1}
		tx_udpMetaFifo_V_val {Type I LastRead 0 FirstWrite -1}
		header_header_V_7 {Type IO LastRead -1 FirstWrite -1}
		tx_shift2udpFifo_V_d {Type I LastRead 0 FirstWrite -1}
		tx_shift2udpFifo_V_k {Type I LastRead 0 FirstWrite -1}
		tx_shift2udpFifo_V_l {Type I LastRead 0 FirstWrite -1}
		tx_udp2ipFifo_V_data {Type O LastRead -1 FirstWrite 1}
		tx_udp2ipFifo_V_keep {Type O LastRead -1 FirstWrite 1}
		tx_udp2ipFifo_V_last {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_udpMetaFifo_V_the { ap_fifo {  { tx_udpMetaFifo_V_the_dout fifo_data 0 16 }  { tx_udpMetaFifo_V_the_empty_n fifo_status 0 1 }  { tx_udpMetaFifo_V_the_read fifo_update 1 1 } } }
	tx_udpMetaFifo_V_my_s { ap_fifo {  { tx_udpMetaFifo_V_my_s_dout fifo_data 0 16 }  { tx_udpMetaFifo_V_my_s_empty_n fifo_status 0 1 }  { tx_udpMetaFifo_V_my_s_read fifo_update 1 1 } } }
	tx_udpMetaFifo_V_len { ap_fifo {  { tx_udpMetaFifo_V_len_dout fifo_data 0 16 }  { tx_udpMetaFifo_V_len_empty_n fifo_status 0 1 }  { tx_udpMetaFifo_V_len_read fifo_update 1 1 } } }
	tx_udpMetaFifo_V_val { ap_fifo {  { tx_udpMetaFifo_V_val_dout fifo_data 0 1 }  { tx_udpMetaFifo_V_val_empty_n fifo_status 0 1 }  { tx_udpMetaFifo_V_val_read fifo_update 1 1 } } }
	tx_shift2udpFifo_V_d { ap_fifo {  { tx_shift2udpFifo_V_d_dout fifo_data 0 512 }  { tx_shift2udpFifo_V_d_empty_n fifo_status 0 1 }  { tx_shift2udpFifo_V_d_read fifo_update 1 1 } } }
	tx_shift2udpFifo_V_k { ap_fifo {  { tx_shift2udpFifo_V_k_dout fifo_data 0 64 }  { tx_shift2udpFifo_V_k_empty_n fifo_status 0 1 }  { tx_shift2udpFifo_V_k_read fifo_update 1 1 } } }
	tx_shift2udpFifo_V_l { ap_fifo {  { tx_shift2udpFifo_V_l_dout fifo_data 0 1 }  { tx_shift2udpFifo_V_l_empty_n fifo_status 0 1 }  { tx_shift2udpFifo_V_l_read fifo_update 1 1 } } }
	tx_udp2ipFifo_V_data { ap_fifo {  { tx_udp2ipFifo_V_data_din fifo_data 1 512 }  { tx_udp2ipFifo_V_data_full_n fifo_status 0 1 }  { tx_udp2ipFifo_V_data_write fifo_update 1 1 } } }
	tx_udp2ipFifo_V_keep { ap_fifo {  { tx_udp2ipFifo_V_keep_din fifo_data 1 64 }  { tx_udp2ipFifo_V_keep_full_n fifo_status 0 1 }  { tx_udp2ipFifo_V_keep_write fifo_update 1 1 } } }
	tx_udp2ipFifo_V_last { ap_fifo {  { tx_udp2ipFifo_V_last_din fifo_data 1 1 }  { tx_udp2ipFifo_V_last_full_n fifo_status 0 1 }  { tx_udp2ipFifo_V_last_write fifo_update 1 1 } } }
}
