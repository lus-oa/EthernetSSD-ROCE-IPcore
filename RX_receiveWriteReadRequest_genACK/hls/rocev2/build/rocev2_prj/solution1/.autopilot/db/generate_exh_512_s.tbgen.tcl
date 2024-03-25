set moduleName generate_exh_512_s
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
set C_modelName {generate_exh<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_exhMetaFifo_V int 135 regular {fifo 0 volatile } {global 0}  }
	{ txExh2msnTable_req_V int 16 regular {fifo 1 volatile } {global 1}  }
	{ msnTable2txExh_rsp_V int 56 regular {fifo 0 volatile } {global 0}  }
	{ tx_exh2payFifo_V_dat int 512 regular {fifo 1 volatile } {global 1}  }
	{ tx_exh2payFifo_V_kee int 64 regular {fifo 1 volatile } {global 1}  }
	{ tx_exh2payFifo_V_las int 1 regular {fifo 1 volatile } {global 1}  }
	{ tx_packetInfoFifo_V int 3 regular {fifo 1 volatile } {global 1}  }
	{ tx_lengthFifo_V_V int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_readReqTable_upd_s_0 int 40 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_exhMetaFifo_V", "interface" : "fifo", "bitwidth" : 135, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "txExh2msnTable_req_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "msnTable2txExh_rsp_V", "interface" : "fifo", "bitwidth" : 56, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2payFifo_V_dat", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2payFifo_V_kee", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_exh2payFifo_V_las", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_packetInfoFifo_V", "interface" : "fifo", "bitwidth" : 3, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_lengthFifo_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_readReqTable_upd_s_0", "interface" : "fifo", "bitwidth" : 40, "direction" : "WRITEONLY", "extern" : 0} ]}
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
	{ msnTable2txExh_rsp_V_dout sc_in sc_lv 56 signal 2 } 
	{ msnTable2txExh_rsp_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ msnTable2txExh_rsp_V_read sc_out sc_logic 1 signal 2 } 
	{ tx_exhMetaFifo_V_dout sc_in sc_lv 135 signal 0 } 
	{ tx_exhMetaFifo_V_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_exhMetaFifo_V_read sc_out sc_logic 1 signal 0 } 
	{ tx_packetInfoFifo_V_din sc_out sc_lv 3 signal 6 } 
	{ tx_packetInfoFifo_V_full_n sc_in sc_logic 1 signal 6 } 
	{ tx_packetInfoFifo_V_write sc_out sc_logic 1 signal 6 } 
	{ tx_exh2payFifo_V_dat_din sc_out sc_lv 512 signal 3 } 
	{ tx_exh2payFifo_V_dat_full_n sc_in sc_logic 1 signal 3 } 
	{ tx_exh2payFifo_V_dat_write sc_out sc_logic 1 signal 3 } 
	{ tx_exh2payFifo_V_kee_din sc_out sc_lv 64 signal 4 } 
	{ tx_exh2payFifo_V_kee_full_n sc_in sc_logic 1 signal 4 } 
	{ tx_exh2payFifo_V_kee_write sc_out sc_logic 1 signal 4 } 
	{ tx_exh2payFifo_V_las_din sc_out sc_lv 1 signal 5 } 
	{ tx_exh2payFifo_V_las_full_n sc_in sc_logic 1 signal 5 } 
	{ tx_exh2payFifo_V_las_write sc_out sc_logic 1 signal 5 } 
	{ tx_lengthFifo_V_V_din sc_out sc_lv 16 signal 7 } 
	{ tx_lengthFifo_V_V_full_n sc_in sc_logic 1 signal 7 } 
	{ tx_lengthFifo_V_V_write sc_out sc_logic 1 signal 7 } 
	{ tx_readReqTable_upd_s_0_din sc_out sc_lv 40 signal 8 } 
	{ tx_readReqTable_upd_s_0_full_n sc_in sc_logic 1 signal 8 } 
	{ tx_readReqTable_upd_s_0_write sc_out sc_logic 1 signal 8 } 
	{ txExh2msnTable_req_V_din sc_out sc_lv 16 signal 1 } 
	{ txExh2msnTable_req_V_full_n sc_in sc_logic 1 signal 1 } 
	{ txExh2msnTable_req_V_write sc_out sc_logic 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "msnTable2txExh_rsp_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":56, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp_V", "role": "dout" }} , 
 	{ "name": "msnTable2txExh_rsp_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp_V", "role": "empty_n" }} , 
 	{ "name": "msnTable2txExh_rsp_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2txExh_rsp_V", "role": "read" }} , 
 	{ "name": "tx_exhMetaFifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":135, "type": "signal", "bundle":{"name": "tx_exhMetaFifo_V", "role": "dout" }} , 
 	{ "name": "tx_exhMetaFifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exhMetaFifo_V", "role": "empty_n" }} , 
 	{ "name": "tx_exhMetaFifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exhMetaFifo_V", "role": "read" }} , 
 	{ "name": "tx_packetInfoFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "tx_packetInfoFifo_V", "role": "din" }} , 
 	{ "name": "tx_packetInfoFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_packetInfoFifo_V", "role": "full_n" }} , 
 	{ "name": "tx_packetInfoFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_packetInfoFifo_V", "role": "write" }} , 
 	{ "name": "tx_exh2payFifo_V_dat_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_dat", "role": "din" }} , 
 	{ "name": "tx_exh2payFifo_V_dat_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_dat", "role": "full_n" }} , 
 	{ "name": "tx_exh2payFifo_V_dat_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_dat", "role": "write" }} , 
 	{ "name": "tx_exh2payFifo_V_kee_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_kee", "role": "din" }} , 
 	{ "name": "tx_exh2payFifo_V_kee_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_kee", "role": "full_n" }} , 
 	{ "name": "tx_exh2payFifo_V_kee_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_kee", "role": "write" }} , 
 	{ "name": "tx_exh2payFifo_V_las_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_las", "role": "din" }} , 
 	{ "name": "tx_exh2payFifo_V_las_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_las", "role": "full_n" }} , 
 	{ "name": "tx_exh2payFifo_V_las_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_exh2payFifo_V_las", "role": "write" }} , 
 	{ "name": "tx_lengthFifo_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_lengthFifo_V_V", "role": "din" }} , 
 	{ "name": "tx_lengthFifo_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_lengthFifo_V_V", "role": "full_n" }} , 
 	{ "name": "tx_lengthFifo_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_lengthFifo_V_V", "role": "write" }} , 
 	{ "name": "tx_readReqTable_upd_s_0_din", "direction": "out", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "tx_readReqTable_upd_s_0", "role": "din" }} , 
 	{ "name": "tx_readReqTable_upd_s_0_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqTable_upd_s_0", "role": "full_n" }} , 
 	{ "name": "tx_readReqTable_upd_s_0_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_readReqTable_upd_s_0", "role": "write" }} , 
 	{ "name": "txExh2msnTable_req_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "txExh2msnTable_req_V", "role": "din" }} , 
 	{ "name": "txExh2msnTable_req_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txExh2msnTable_req_V", "role": "full_n" }} , 
 	{ "name": "txExh2msnTable_req_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "txExh2msnTable_req_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "generate_exh_512_s",
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
			{"Name" : "ge_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rdmaHeader_idx_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ackHeader_idx_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_op_code_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_addr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_length_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_isNak", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "metaWritten_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "msnMeta_msn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "msnMeta_r_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_exhMetaFifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exhMetaFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "meta_qpn_V_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_psn_V_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "txExh2msnTable_req_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "txExh2msnTable_req_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "msnTable2txExh_rsp_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "msnTable2txExh_rsp_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2payFifo_V_dat", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2payFifo_V_dat_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2payFifo_V_kee", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2payFifo_V_kee_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_exh2payFifo_V_las", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_exh2payFifo_V_las_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_packetInfoFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_packetInfoFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_lengthFifo_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_lengthFifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_readReqTable_upd_s_0", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_readReqTable_upd_s_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ackHeader_header_V_1", "Type" : "Vld", "Direction" : "O"}]}]}


set ArgLastReadFirstWriteLatency {
	generate_exh_512_s {
		ge_state {Type IO LastRead -1 FirstWrite -1}
		rdmaHeader_idx_1 {Type IO LastRead -1 FirstWrite -1}
		ackHeader_idx_1 {Type IO LastRead -1 FirstWrite -1}
		meta_op_code_8 {Type IO LastRead -1 FirstWrite -1}
		meta_addr_V {Type IO LastRead -1 FirstWrite -1}
		meta_length_V_1 {Type IO LastRead -1 FirstWrite -1}
		meta_isNak {Type IO LastRead -1 FirstWrite -1}
		metaWritten_4 {Type IO LastRead -1 FirstWrite -1}
		msnMeta_msn_V {Type IO LastRead -1 FirstWrite -1}
		msnMeta_r_key_V {Type IO LastRead -1 FirstWrite -1}
		tx_exhMetaFifo_V {Type I LastRead 0 FirstWrite -1}
		meta_qpn_V_1 {Type IO LastRead -1 FirstWrite -1}
		meta_psn_V_3 {Type IO LastRead -1 FirstWrite -1}
		txExh2msnTable_req_V {Type O LastRead -1 FirstWrite 1}
		msnTable2txExh_rsp_V {Type I LastRead 0 FirstWrite -1}
		tx_exh2payFifo_V_dat {Type O LastRead -1 FirstWrite 1}
		tx_exh2payFifo_V_kee {Type O LastRead -1 FirstWrite 1}
		tx_exh2payFifo_V_las {Type O LastRead -1 FirstWrite 1}
		tx_packetInfoFifo_V {Type O LastRead -1 FirstWrite 1}
		tx_lengthFifo_V_V {Type O LastRead -1 FirstWrite 1}
		tx_readReqTable_upd_s_0 {Type O LastRead -1 FirstWrite 1}
		ackHeader_header_V_1 {Type O LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_exhMetaFifo_V { ap_fifo {  { tx_exhMetaFifo_V_dout fifo_data 0 135 }  { tx_exhMetaFifo_V_empty_n fifo_status 0 1 }  { tx_exhMetaFifo_V_read fifo_update 1 1 } } }
	txExh2msnTable_req_V { ap_fifo {  { txExh2msnTable_req_V_din fifo_data 1 16 }  { txExh2msnTable_req_V_full_n fifo_status 0 1 }  { txExh2msnTable_req_V_write fifo_update 1 1 } } }
	msnTable2txExh_rsp_V { ap_fifo {  { msnTable2txExh_rsp_V_dout fifo_data 0 56 }  { msnTable2txExh_rsp_V_empty_n fifo_status 0 1 }  { msnTable2txExh_rsp_V_read fifo_update 1 1 } } }
	tx_exh2payFifo_V_dat { ap_fifo {  { tx_exh2payFifo_V_dat_din fifo_data 1 512 }  { tx_exh2payFifo_V_dat_full_n fifo_status 0 1 }  { tx_exh2payFifo_V_dat_write fifo_update 1 1 } } }
	tx_exh2payFifo_V_kee { ap_fifo {  { tx_exh2payFifo_V_kee_din fifo_data 1 64 }  { tx_exh2payFifo_V_kee_full_n fifo_status 0 1 }  { tx_exh2payFifo_V_kee_write fifo_update 1 1 } } }
	tx_exh2payFifo_V_las { ap_fifo {  { tx_exh2payFifo_V_las_din fifo_data 1 1 }  { tx_exh2payFifo_V_las_full_n fifo_status 0 1 }  { tx_exh2payFifo_V_las_write fifo_update 1 1 } } }
	tx_packetInfoFifo_V { ap_fifo {  { tx_packetInfoFifo_V_din fifo_data 1 3 }  { tx_packetInfoFifo_V_full_n fifo_status 0 1 }  { tx_packetInfoFifo_V_write fifo_update 1 1 } } }
	tx_lengthFifo_V_V { ap_fifo {  { tx_lengthFifo_V_V_din fifo_data 1 16 }  { tx_lengthFifo_V_V_full_n fifo_status 0 1 }  { tx_lengthFifo_V_V_write fifo_update 1 1 } } }
	tx_readReqTable_upd_s_0 { ap_fifo {  { tx_readReqTable_upd_s_0_din fifo_data 1 40 }  { tx_readReqTable_upd_s_0_full_n fifo_status 0 1 }  { tx_readReqTable_upd_s_0_write fifo_update 1 1 } } }
}
