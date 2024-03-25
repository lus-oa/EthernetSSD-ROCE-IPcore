set moduleName tx_pkg_arbiter_512_s
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
set C_modelName {tx_pkg_arbiter<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ s_axis_tx_data_V_data_V int 512 regular {axi_s 0 volatile  { s_axis_tx_data Data } }  }
	{ s_axis_tx_data_V_keep_V int 64 regular {axi_s 0 volatile  { s_axis_tx_data Keep } }  }
	{ s_axis_tx_data_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_tx_data Last } }  }
	{ s_axis_mem_read_data_V_data_V int 512 regular {axi_s 0 volatile  { s_axis_mem_read_data Data } }  }
	{ s_axis_mem_read_data_V_keep_V int 64 regular {axi_s 0 volatile  { s_axis_mem_read_data Keep } }  }
	{ s_axis_mem_read_data_V_last_V int 1 regular {axi_s 0 volatile  { s_axis_mem_read_data Last } }  }
	{ tx_pkgInfoFifo_V_typ int 1 regular {fifo 0 volatile } {global 0}  }
	{ tx_pkgInfoFifo_V_sou int 1 regular {fifo 0 volatile } {global 0}  }
	{ tx_pkgInfoFifo_V_wor int 29 regular {fifo 0 volatile } {global 0}  }
	{ tx_split2aethShift_V_1 int 512 regular {fifo 1 volatile } {global 1}  }
	{ tx_split2aethShift_V_2 int 64 regular {fifo 1 volatile } {global 1}  }
	{ tx_split2aethShift_V int 1 regular {fifo 1 volatile } {global 1}  }
	{ tx_rethMerge2rethShi_3 int 512 regular {fifo 1 volatile } {global 1}  }
	{ tx_rethMerge2rethShi_5 int 64 regular {fifo 1 volatile } {global 1}  }
	{ tx_rethMerge2rethShi_6 int 1 regular {fifo 1 volatile } {global 1}  }
	{ tx_rawPayFifo_V_data int 512 regular {fifo 1 volatile } {global 1}  }
	{ tx_rawPayFifo_V_keep int 64 regular {fifo 1 volatile } {global 1}  }
	{ tx_rawPayFifo_V_last int 1 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "s_axis_tx_data_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_tx_data_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_tx_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_mem_read_data_V_data_V", "interface" : "axis", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_mem_read_data_V_keep_V", "interface" : "axis", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "s_axis_mem_read_data_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "tx_pkgInfoFifo_V_typ", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_pkgInfoFifo_V_sou", "interface" : "fifo", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_pkgInfoFifo_V_wor", "interface" : "fifo", "bitwidth" : 29, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_split2aethShift_V_1", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_split2aethShift_V_2", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_split2aethShift_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_rethMerge2rethShi_3", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_rethMerge2rethShi_5", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_rethMerge2rethShi_6", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_rawPayFifo_V_data", "interface" : "fifo", "bitwidth" : 512, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_rawPayFifo_V_keep", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_rawPayFifo_V_last", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 53
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ s_axis_tx_data_TVALID sc_in sc_logic 1 invld 0 } 
	{ s_axis_mem_read_data_TVALID sc_in sc_logic 1 invld 3 } 
	{ tx_pkgInfoFifo_V_typ_dout sc_in sc_lv 1 signal 6 } 
	{ tx_pkgInfoFifo_V_typ_empty_n sc_in sc_logic 1 signal 6 } 
	{ tx_pkgInfoFifo_V_typ_read sc_out sc_logic 1 signal 6 } 
	{ tx_pkgInfoFifo_V_sou_dout sc_in sc_lv 1 signal 7 } 
	{ tx_pkgInfoFifo_V_sou_empty_n sc_in sc_logic 1 signal 7 } 
	{ tx_pkgInfoFifo_V_sou_read sc_out sc_logic 1 signal 7 } 
	{ tx_pkgInfoFifo_V_wor_dout sc_in sc_lv 29 signal 8 } 
	{ tx_pkgInfoFifo_V_wor_empty_n sc_in sc_logic 1 signal 8 } 
	{ tx_pkgInfoFifo_V_wor_read sc_out sc_logic 1 signal 8 } 
	{ tx_rawPayFifo_V_data_din sc_out sc_lv 512 signal 15 } 
	{ tx_rawPayFifo_V_data_full_n sc_in sc_logic 1 signal 15 } 
	{ tx_rawPayFifo_V_data_write sc_out sc_logic 1 signal 15 } 
	{ tx_rawPayFifo_V_keep_din sc_out sc_lv 64 signal 16 } 
	{ tx_rawPayFifo_V_keep_full_n sc_in sc_logic 1 signal 16 } 
	{ tx_rawPayFifo_V_keep_write sc_out sc_logic 1 signal 16 } 
	{ tx_rawPayFifo_V_last_din sc_out sc_lv 1 signal 17 } 
	{ tx_rawPayFifo_V_last_full_n sc_in sc_logic 1 signal 17 } 
	{ tx_rawPayFifo_V_last_write sc_out sc_logic 1 signal 17 } 
	{ tx_rethMerge2rethShi_3_din sc_out sc_lv 512 signal 12 } 
	{ tx_rethMerge2rethShi_3_full_n sc_in sc_logic 1 signal 12 } 
	{ tx_rethMerge2rethShi_3_write sc_out sc_logic 1 signal 12 } 
	{ tx_rethMerge2rethShi_5_din sc_out sc_lv 64 signal 13 } 
	{ tx_rethMerge2rethShi_5_full_n sc_in sc_logic 1 signal 13 } 
	{ tx_rethMerge2rethShi_5_write sc_out sc_logic 1 signal 13 } 
	{ tx_rethMerge2rethShi_6_din sc_out sc_lv 1 signal 14 } 
	{ tx_rethMerge2rethShi_6_full_n sc_in sc_logic 1 signal 14 } 
	{ tx_rethMerge2rethShi_6_write sc_out sc_logic 1 signal 14 } 
	{ tx_split2aethShift_V_1_din sc_out sc_lv 512 signal 9 } 
	{ tx_split2aethShift_V_1_full_n sc_in sc_logic 1 signal 9 } 
	{ tx_split2aethShift_V_1_write sc_out sc_logic 1 signal 9 } 
	{ tx_split2aethShift_V_2_din sc_out sc_lv 64 signal 10 } 
	{ tx_split2aethShift_V_2_full_n sc_in sc_logic 1 signal 10 } 
	{ tx_split2aethShift_V_2_write sc_out sc_logic 1 signal 10 } 
	{ tx_split2aethShift_V_din sc_out sc_lv 1 signal 11 } 
	{ tx_split2aethShift_V_full_n sc_in sc_logic 1 signal 11 } 
	{ tx_split2aethShift_V_write sc_out sc_logic 1 signal 11 } 
	{ s_axis_tx_data_TDATA sc_in sc_lv 512 signal 0 } 
	{ s_axis_tx_data_TREADY sc_out sc_logic 1 inacc 2 } 
	{ s_axis_tx_data_TKEEP sc_in sc_lv 64 signal 1 } 
	{ s_axis_tx_data_TLAST sc_in sc_lv 1 signal 2 } 
	{ s_axis_mem_read_data_TDATA sc_in sc_lv 512 signal 3 } 
	{ s_axis_mem_read_data_TREADY sc_out sc_logic 1 inacc 5 } 
	{ s_axis_mem_read_data_TKEEP sc_in sc_lv 64 signal 4 } 
	{ s_axis_mem_read_data_TLAST sc_in sc_lv 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "s_axis_tx_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_tx_data_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_mem_read_data_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_axis_mem_read_data_V_data_V", "role": "default" }} , 
 	{ "name": "tx_pkgInfoFifo_V_typ_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo_V_typ", "role": "dout" }} , 
 	{ "name": "tx_pkgInfoFifo_V_typ_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo_V_typ", "role": "empty_n" }} , 
 	{ "name": "tx_pkgInfoFifo_V_typ_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo_V_typ", "role": "read" }} , 
 	{ "name": "tx_pkgInfoFifo_V_sou_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo_V_sou", "role": "dout" }} , 
 	{ "name": "tx_pkgInfoFifo_V_sou_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo_V_sou", "role": "empty_n" }} , 
 	{ "name": "tx_pkgInfoFifo_V_sou_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo_V_sou", "role": "read" }} , 
 	{ "name": "tx_pkgInfoFifo_V_wor_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":29, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo_V_wor", "role": "dout" }} , 
 	{ "name": "tx_pkgInfoFifo_V_wor_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo_V_wor", "role": "empty_n" }} , 
 	{ "name": "tx_pkgInfoFifo_V_wor_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_pkgInfoFifo_V_wor", "role": "read" }} , 
 	{ "name": "tx_rawPayFifo_V_data_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_data", "role": "din" }} , 
 	{ "name": "tx_rawPayFifo_V_data_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_data", "role": "full_n" }} , 
 	{ "name": "tx_rawPayFifo_V_data_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_data", "role": "write" }} , 
 	{ "name": "tx_rawPayFifo_V_keep_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_keep", "role": "din" }} , 
 	{ "name": "tx_rawPayFifo_V_keep_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_keep", "role": "full_n" }} , 
 	{ "name": "tx_rawPayFifo_V_keep_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_keep", "role": "write" }} , 
 	{ "name": "tx_rawPayFifo_V_last_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_last", "role": "din" }} , 
 	{ "name": "tx_rawPayFifo_V_last_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_last", "role": "full_n" }} , 
 	{ "name": "tx_rawPayFifo_V_last_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rawPayFifo_V_last", "role": "write" }} , 
 	{ "name": "tx_rethMerge2rethShi_3_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShi_3", "role": "din" }} , 
 	{ "name": "tx_rethMerge2rethShi_3_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShi_3", "role": "full_n" }} , 
 	{ "name": "tx_rethMerge2rethShi_3_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShi_3", "role": "write" }} , 
 	{ "name": "tx_rethMerge2rethShi_5_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShi_5", "role": "din" }} , 
 	{ "name": "tx_rethMerge2rethShi_5_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShi_5", "role": "full_n" }} , 
 	{ "name": "tx_rethMerge2rethShi_5_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShi_5", "role": "write" }} , 
 	{ "name": "tx_rethMerge2rethShi_6_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShi_6", "role": "din" }} , 
 	{ "name": "tx_rethMerge2rethShi_6_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShi_6", "role": "full_n" }} , 
 	{ "name": "tx_rethMerge2rethShi_6_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_rethMerge2rethShi_6", "role": "write" }} , 
 	{ "name": "tx_split2aethShift_V_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "tx_split2aethShift_V_1", "role": "din" }} , 
 	{ "name": "tx_split2aethShift_V_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_split2aethShift_V_1", "role": "full_n" }} , 
 	{ "name": "tx_split2aethShift_V_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_split2aethShift_V_1", "role": "write" }} , 
 	{ "name": "tx_split2aethShift_V_2_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "tx_split2aethShift_V_2", "role": "din" }} , 
 	{ "name": "tx_split2aethShift_V_2_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_split2aethShift_V_2", "role": "full_n" }} , 
 	{ "name": "tx_split2aethShift_V_2_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_split2aethShift_V_2", "role": "write" }} , 
 	{ "name": "tx_split2aethShift_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_split2aethShift_V", "role": "din" }} , 
 	{ "name": "tx_split2aethShift_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_split2aethShift_V", "role": "full_n" }} , 
 	{ "name": "tx_split2aethShift_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_split2aethShift_V", "role": "write" }} , 
 	{ "name": "s_axis_tx_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_axis_tx_data_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_tx_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_tx_data_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_tx_data_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_tx_data_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_tx_data_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_tx_data_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_mem_read_data_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "s_axis_mem_read_data_V_data_V", "role": "default" }} , 
 	{ "name": "s_axis_mem_read_data_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_axis_mem_read_data_V_last_V", "role": "default" }} , 
 	{ "name": "s_axis_mem_read_data_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "s_axis_mem_read_data_V_keep_V", "role": "default" }} , 
 	{ "name": "s_axis_mem_read_data_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "s_axis_mem_read_data_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "tx_pkg_arbiter_512_s",
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
			{"Name" : "s_axis_tx_data_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_tx_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_tx_data_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "s_axis_tx_data_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "s_axis_mem_read_data_V_data_V", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "s_axis_mem_read_data_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "s_axis_mem_read_data_V_keep_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "s_axis_mem_read_data_V_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "info_type", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "info_words_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "wordCounter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "tx_pkgInfoFifo_V_typ", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_pkgInfoFifo_V_typ_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_pkgInfoFifo_V_sou", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_pkgInfoFifo_V_sou_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_pkgInfoFifo_V_wor", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_pkgInfoFifo_V_wor_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_split2aethShift_V_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_split2aethShift_V_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_split2aethShift_V_2", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_split2aethShift_V_2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_split2aethShift_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_split2aethShift_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rethMerge2rethShi_3", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rethMerge2rethShi_3_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rethMerge2rethShi_5", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rethMerge2rethShi_5_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rethMerge2rethShi_6", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rethMerge2rethShi_6_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rawPayFifo_V_data", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rawPayFifo_V_data_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rawPayFifo_V_keep", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rawPayFifo_V_keep_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_rawPayFifo_V_last", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_rawPayFifo_V_last_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	tx_pkg_arbiter_512_s {
		s_axis_tx_data_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_tx_data_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_tx_data_V_last_V {Type I LastRead 0 FirstWrite -1}
		s_axis_mem_read_data_V_data_V {Type I LastRead 0 FirstWrite -1}
		s_axis_mem_read_data_V_keep_V {Type I LastRead 0 FirstWrite -1}
		s_axis_mem_read_data_V_last_V {Type I LastRead 0 FirstWrite -1}
		state {Type IO LastRead -1 FirstWrite -1}
		info_type {Type IO LastRead -1 FirstWrite -1}
		info_words_V {Type IO LastRead -1 FirstWrite -1}
		wordCounter_V {Type IO LastRead -1 FirstWrite -1}
		tx_pkgInfoFifo_V_typ {Type I LastRead 0 FirstWrite -1}
		tx_pkgInfoFifo_V_sou {Type I LastRead 0 FirstWrite -1}
		tx_pkgInfoFifo_V_wor {Type I LastRead 0 FirstWrite -1}
		tx_split2aethShift_V_1 {Type O LastRead -1 FirstWrite 1}
		tx_split2aethShift_V_2 {Type O LastRead -1 FirstWrite 1}
		tx_split2aethShift_V {Type O LastRead -1 FirstWrite 1}
		tx_rethMerge2rethShi_3 {Type O LastRead -1 FirstWrite 1}
		tx_rethMerge2rethShi_5 {Type O LastRead -1 FirstWrite 1}
		tx_rethMerge2rethShi_6 {Type O LastRead -1 FirstWrite 1}
		tx_rawPayFifo_V_data {Type O LastRead -1 FirstWrite 1}
		tx_rawPayFifo_V_keep {Type O LastRead -1 FirstWrite 1}
		tx_rawPayFifo_V_last {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	s_axis_tx_data_V_data_V { axis {  { s_axis_tx_data_TVALID in_vld 0 1 }  { s_axis_tx_data_TDATA in_data 0 512 } } }
	s_axis_tx_data_V_keep_V { axis {  { s_axis_tx_data_TKEEP in_data 0 64 } } }
	s_axis_tx_data_V_last_V { axis {  { s_axis_tx_data_TREADY in_acc 1 1 }  { s_axis_tx_data_TLAST in_data 0 1 } } }
	s_axis_mem_read_data_V_data_V { axis {  { s_axis_mem_read_data_TVALID in_vld 0 1 }  { s_axis_mem_read_data_TDATA in_data 0 512 } } }
	s_axis_mem_read_data_V_keep_V { axis {  { s_axis_mem_read_data_TKEEP in_data 0 64 } } }
	s_axis_mem_read_data_V_last_V { axis {  { s_axis_mem_read_data_TREADY in_acc 1 1 }  { s_axis_mem_read_data_TLAST in_data 0 1 } } }
	tx_pkgInfoFifo_V_typ { ap_fifo {  { tx_pkgInfoFifo_V_typ_dout fifo_data 0 1 }  { tx_pkgInfoFifo_V_typ_empty_n fifo_status 0 1 }  { tx_pkgInfoFifo_V_typ_read fifo_update 1 1 } } }
	tx_pkgInfoFifo_V_sou { ap_fifo {  { tx_pkgInfoFifo_V_sou_dout fifo_data 0 1 }  { tx_pkgInfoFifo_V_sou_empty_n fifo_status 0 1 }  { tx_pkgInfoFifo_V_sou_read fifo_update 1 1 } } }
	tx_pkgInfoFifo_V_wor { ap_fifo {  { tx_pkgInfoFifo_V_wor_dout fifo_data 0 29 }  { tx_pkgInfoFifo_V_wor_empty_n fifo_status 0 1 }  { tx_pkgInfoFifo_V_wor_read fifo_update 1 1 } } }
	tx_split2aethShift_V_1 { ap_fifo {  { tx_split2aethShift_V_1_din fifo_data 1 512 }  { tx_split2aethShift_V_1_full_n fifo_status 0 1 }  { tx_split2aethShift_V_1_write fifo_update 1 1 } } }
	tx_split2aethShift_V_2 { ap_fifo {  { tx_split2aethShift_V_2_din fifo_data 1 64 }  { tx_split2aethShift_V_2_full_n fifo_status 0 1 }  { tx_split2aethShift_V_2_write fifo_update 1 1 } } }
	tx_split2aethShift_V { ap_fifo {  { tx_split2aethShift_V_din fifo_data 1 1 }  { tx_split2aethShift_V_full_n fifo_status 0 1 }  { tx_split2aethShift_V_write fifo_update 1 1 } } }
	tx_rethMerge2rethShi_3 { ap_fifo {  { tx_rethMerge2rethShi_3_din fifo_data 1 512 }  { tx_rethMerge2rethShi_3_full_n fifo_status 0 1 }  { tx_rethMerge2rethShi_3_write fifo_update 1 1 } } }
	tx_rethMerge2rethShi_5 { ap_fifo {  { tx_rethMerge2rethShi_5_din fifo_data 1 64 }  { tx_rethMerge2rethShi_5_full_n fifo_status 0 1 }  { tx_rethMerge2rethShi_5_write fifo_update 1 1 } } }
	tx_rethMerge2rethShi_6 { ap_fifo {  { tx_rethMerge2rethShi_6_din fifo_data 1 1 }  { tx_rethMerge2rethShi_6_full_n fifo_status 0 1 }  { tx_rethMerge2rethShi_6_write fifo_update 1 1 } } }
	tx_rawPayFifo_V_data { ap_fifo {  { tx_rawPayFifo_V_data_din fifo_data 1 512 }  { tx_rawPayFifo_V_data_full_n fifo_status 0 1 }  { tx_rawPayFifo_V_data_write fifo_update 1 1 } } }
	tx_rawPayFifo_V_keep { ap_fifo {  { tx_rawPayFifo_V_keep_din fifo_data 1 64 }  { tx_rawPayFifo_V_keep_full_n fifo_status 0 1 }  { tx_rawPayFifo_V_keep_write fifo_update 1 1 } } }
	tx_rawPayFifo_V_last { ap_fifo {  { tx_rawPayFifo_V_last_din fifo_data 1 1 }  { tx_rawPayFifo_V_last_full_n fifo_status 0 1 }  { tx_rawPayFifo_V_last_write fifo_update 1 1 } } }
}
