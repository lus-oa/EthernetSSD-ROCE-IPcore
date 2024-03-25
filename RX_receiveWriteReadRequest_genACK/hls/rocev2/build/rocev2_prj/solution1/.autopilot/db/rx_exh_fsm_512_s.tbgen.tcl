set moduleName rx_exh_fsm_512_s
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
set C_modelName {rx_exh_fsm<512>}
set C_modelType { void 0 }
set C_modelArgList {
	{ memoryWriteCmd_V_dat int 96 regular {axi_s 1 volatile  { m_axis_mem_write_cmd Data } }  }
	{ memoryWriteCmd_V_dest_V int 1 regular {axi_s 1 volatile  { m_axis_mem_write_cmd Dest } }  }
	{ rx_fsm2exh_MetaFifo_s_11 int 92 regular {fifo 0 volatile } {global 0}  }
	{ rx_drop2exhFsm_MetaF_1 int 241 regular {fifo 0 volatile } {global 0}  }
	{ rxExh2msnTable_upd_r_1 int 137 regular {fifo 1 volatile } {global 1}  }
	{ rx_readReqAddr_pop_r_4 int 17 regular {fifo 1 volatile } {global 1}  }
	{ msnTable2rxExh_rsp_V int 152 regular {fifo 0 volatile } {global 0}  }
	{ exh_lengthFifo_V_V int 16 regular {fifo 0 volatile } {global 0}  }
	{ rx_readReqAddr_pop_r_1 int 64 regular {fifo 0 volatile } {global 0}  }
	{ rx_exhEventMetaFifo_s_12 int 50 regular {fifo 1 volatile } {global 1}  }
	{ rx_pkgSplitTypeFifo_s_7 int 6 regular {fifo 1 volatile } {global 1}  }
	{ rx_pkgShiftTypeFifo_s_8 int 2 regular {fifo 1 volatile } {global 1}  }
	{ rx_readRequestFifo_V int 129 regular {fifo 1 volatile } {global 1}  }
	{ rx_readReqTable_upd_1 int 41 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "memoryWriteCmd_V_dat", "interface" : "axis", "bitwidth" : 96, "direction" : "WRITEONLY"} , 
 	{ "Name" : "memoryWriteCmd_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rx_fsm2exh_MetaFifo_s_11", "interface" : "fifo", "bitwidth" : 92, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_drop2exhFsm_MetaF_1", "interface" : "fifo", "bitwidth" : 241, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rxExh2msnTable_upd_r_1", "interface" : "fifo", "bitwidth" : 137, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqAddr_pop_r_4", "interface" : "fifo", "bitwidth" : 17, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "msnTable2rxExh_rsp_V", "interface" : "fifo", "bitwidth" : 152, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "exh_lengthFifo_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqAddr_pop_r_1", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exhEventMetaFifo_s_12", "interface" : "fifo", "bitwidth" : 50, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_pkgSplitTypeFifo_s_7", "interface" : "fifo", "bitwidth" : 6, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_pkgShiftTypeFifo_s_8", "interface" : "fifo", "bitwidth" : 2, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readRequestFifo_V", "interface" : "fifo", "bitwidth" : 129, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_readReqTable_upd_1", "interface" : "fifo", "bitwidth" : 41, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 47
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ msnTable2rxExh_rsp_V_dout sc_in sc_lv 152 signal 6 } 
	{ msnTable2rxExh_rsp_V_empty_n sc_in sc_logic 1 signal 6 } 
	{ msnTable2rxExh_rsp_V_read sc_out sc_logic 1 signal 6 } 
	{ exh_lengthFifo_V_V_dout sc_in sc_lv 16 signal 7 } 
	{ exh_lengthFifo_V_V_empty_n sc_in sc_logic 1 signal 7 } 
	{ exh_lengthFifo_V_V_read sc_out sc_logic 1 signal 7 } 
	{ rx_readReqAddr_pop_r_1_dout sc_in sc_lv 64 signal 8 } 
	{ rx_readReqAddr_pop_r_1_empty_n sc_in sc_logic 1 signal 8 } 
	{ rx_readReqAddr_pop_r_1_read sc_out sc_logic 1 signal 8 } 
	{ rx_fsm2exh_MetaFifo_s_11_dout sc_in sc_lv 92 signal 2 } 
	{ rx_fsm2exh_MetaFifo_s_11_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_fsm2exh_MetaFifo_s_11_read sc_out sc_logic 1 signal 2 } 
	{ rx_drop2exhFsm_MetaF_1_dout sc_in sc_lv 241 signal 3 } 
	{ rx_drop2exhFsm_MetaF_1_empty_n sc_in sc_logic 1 signal 3 } 
	{ rx_drop2exhFsm_MetaF_1_read sc_out sc_logic 1 signal 3 } 
	{ rx_pkgShiftTypeFifo_s_8_din sc_out sc_lv 2 signal 11 } 
	{ rx_pkgShiftTypeFifo_s_8_full_n sc_in sc_logic 1 signal 11 } 
	{ rx_pkgShiftTypeFifo_s_8_write sc_out sc_logic 1 signal 11 } 
	{ rxExh2msnTable_upd_r_1_din sc_out sc_lv 137 signal 4 } 
	{ rxExh2msnTable_upd_r_1_full_n sc_in sc_logic 1 signal 4 } 
	{ rxExh2msnTable_upd_r_1_write sc_out sc_logic 1 signal 4 } 
	{ rx_pkgSplitTypeFifo_s_7_din sc_out sc_lv 6 signal 10 } 
	{ rx_pkgSplitTypeFifo_s_7_full_n sc_in sc_logic 1 signal 10 } 
	{ rx_pkgSplitTypeFifo_s_7_write sc_out sc_logic 1 signal 10 } 
	{ rx_readRequestFifo_V_din sc_out sc_lv 129 signal 12 } 
	{ rx_readRequestFifo_V_full_n sc_in sc_logic 1 signal 12 } 
	{ rx_readRequestFifo_V_write sc_out sc_logic 1 signal 12 } 
	{ rx_exhEventMetaFifo_s_12_din sc_out sc_lv 50 signal 9 } 
	{ rx_exhEventMetaFifo_s_12_full_n sc_in sc_logic 1 signal 9 } 
	{ rx_exhEventMetaFifo_s_12_write sc_out sc_logic 1 signal 9 } 
	{ rx_readReqAddr_pop_r_4_din sc_out sc_lv 17 signal 5 } 
	{ rx_readReqAddr_pop_r_4_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_readReqAddr_pop_r_4_write sc_out sc_logic 1 signal 5 } 
	{ m_axis_mem_write_cmd_TREADY sc_in sc_logic 1 outacc 1 } 
	{ rx_readReqTable_upd_1_din sc_out sc_lv 41 signal 13 } 
	{ rx_readReqTable_upd_1_full_n sc_in sc_logic 1 signal 13 } 
	{ rx_readReqTable_upd_1_write sc_out sc_logic 1 signal 13 } 
	{ m_axis_mem_write_cmd_TDATA sc_out sc_lv 96 signal 0 } 
	{ m_axis_mem_write_cmd_TVALID sc_out sc_logic 1 outvld 1 } 
	{ m_axis_mem_write_cmd_TDEST sc_out sc_lv 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "msnTable2rxExh_rsp_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":152, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp_V", "role": "dout" }} , 
 	{ "name": "msnTable2rxExh_rsp_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp_V", "role": "empty_n" }} , 
 	{ "name": "msnTable2rxExh_rsp_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "msnTable2rxExh_rsp_V", "role": "read" }} , 
 	{ "name": "exh_lengthFifo_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "exh_lengthFifo_V_V", "role": "dout" }} , 
 	{ "name": "exh_lengthFifo_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "exh_lengthFifo_V_V", "role": "empty_n" }} , 
 	{ "name": "exh_lengthFifo_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "exh_lengthFifo_V_V", "role": "read" }} , 
 	{ "name": "rx_readReqAddr_pop_r_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_1", "role": "dout" }} , 
 	{ "name": "rx_readReqAddr_pop_r_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_1", "role": "empty_n" }} , 
 	{ "name": "rx_readReqAddr_pop_r_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_1", "role": "read" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_s_11_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":92, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo_s_11", "role": "dout" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_s_11_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo_s_11", "role": "empty_n" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_s_11_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo_s_11", "role": "read" }} , 
 	{ "name": "rx_drop2exhFsm_MetaF_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":241, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaF_1", "role": "dout" }} , 
 	{ "name": "rx_drop2exhFsm_MetaF_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaF_1", "role": "empty_n" }} , 
 	{ "name": "rx_drop2exhFsm_MetaF_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_drop2exhFsm_MetaF_1", "role": "read" }} , 
 	{ "name": "rx_pkgShiftTypeFifo_s_8_din", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_pkgShiftTypeFifo_s_8", "role": "din" }} , 
 	{ "name": "rx_pkgShiftTypeFifo_s_8_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgShiftTypeFifo_s_8", "role": "full_n" }} , 
 	{ "name": "rx_pkgShiftTypeFifo_s_8_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgShiftTypeFifo_s_8", "role": "write" }} , 
 	{ "name": "rxExh2msnTable_upd_r_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":137, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_r_1", "role": "din" }} , 
 	{ "name": "rxExh2msnTable_upd_r_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_r_1", "role": "full_n" }} , 
 	{ "name": "rxExh2msnTable_upd_r_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxExh2msnTable_upd_r_1", "role": "write" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_s_7_din", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo_s_7", "role": "din" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_s_7_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo_s_7", "role": "full_n" }} , 
 	{ "name": "rx_pkgSplitTypeFifo_s_7_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_pkgSplitTypeFifo_s_7", "role": "write" }} , 
 	{ "name": "rx_readRequestFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":129, "type": "signal", "bundle":{"name": "rx_readRequestFifo_V", "role": "din" }} , 
 	{ "name": "rx_readRequestFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readRequestFifo_V", "role": "full_n" }} , 
 	{ "name": "rx_readRequestFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readRequestFifo_V", "role": "write" }} , 
 	{ "name": "rx_exhEventMetaFifo_s_12_din", "direction": "out", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo_s_12", "role": "din" }} , 
 	{ "name": "rx_exhEventMetaFifo_s_12_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo_s_12", "role": "full_n" }} , 
 	{ "name": "rx_exhEventMetaFifo_s_12_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhEventMetaFifo_s_12", "role": "write" }} , 
 	{ "name": "rx_readReqAddr_pop_r_4_din", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_4", "role": "din" }} , 
 	{ "name": "rx_readReqAddr_pop_r_4_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_4", "role": "full_n" }} , 
 	{ "name": "rx_readReqAddr_pop_r_4_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqAddr_pop_r_4", "role": "write" }} , 
 	{ "name": "m_axis_mem_write_cmd_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "memoryWriteCmd_V_dest_V", "role": "ADY" }} , 
 	{ "name": "rx_readReqTable_upd_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":41, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_1", "role": "din" }} , 
 	{ "name": "rx_readReqTable_upd_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_1", "role": "full_n" }} , 
 	{ "name": "rx_readReqTable_upd_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_readReqTable_upd_1", "role": "write" }} , 
 	{ "name": "m_axis_mem_write_cmd_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":96, "type": "signal", "bundle":{"name": "memoryWriteCmd_V_dat", "role": "TDATA" }} , 
 	{ "name": "m_axis_mem_write_cmd_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "memoryWriteCmd_V_dest_V", "role": "LID" }} , 
 	{ "name": "m_axis_mem_write_cmd_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "memoryWriteCmd_V_dest_V", "role": "ST" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "rx_exh_fsm_512_s",
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
			{"Name" : "memoryWriteCmd_V_dat", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "m_axis_mem_write_cmd_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "memoryWriteCmd_V_dest_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "pe_fsmState", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_op_code_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_dest_qp_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_psn_V_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "consumeReadAddr", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dmaMeta_msn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "dmaMeta_vaddr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "udpLength_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_fsm2exh_MetaFifo_s_11", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_fsm2exh_MetaFifo_s_11_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_drop2exhFsm_MetaF_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_drop2exhFsm_MetaF_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "exHeader_header_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rxExh2msnTable_upd_r_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rxExh2msnTable_upd_r_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqAddr_pop_r_4", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqAddr_pop_r_4_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "msnTable2rxExh_rsp_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "msnTable2rxExh_rsp_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "exh_lengthFifo_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "exh_lengthFifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqAddr_pop_r_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqAddr_pop_r_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "dmaMeta_dma_length_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "readReqAddr_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_exhEventMetaFifo_s_12", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exhEventMetaFifo_s_12_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_pkgSplitTypeFifo_s_7", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_pkgSplitTypeFifo_s_7_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_pkgShiftTypeFifo_s_8", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_pkgShiftTypeFifo_s_8_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readRequestFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readRequestFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_readReqTable_upd_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_readReqTable_upd_1_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	rx_exh_fsm_512_s {
		memoryWriteCmd_V_dat {Type O LastRead -1 FirstWrite 1}
		memoryWriteCmd_V_dest_V {Type O LastRead -1 FirstWrite 1}
		pe_fsmState {Type IO LastRead -1 FirstWrite -1}
		meta_op_code_6 {Type IO LastRead -1 FirstWrite -1}
		meta_dest_qp_V_2 {Type IO LastRead -1 FirstWrite -1}
		meta_psn_V_2 {Type IO LastRead -1 FirstWrite -1}
		consumeReadAddr {Type IO LastRead -1 FirstWrite -1}
		dmaMeta_msn_V {Type IO LastRead -1 FirstWrite -1}
		dmaMeta_vaddr_V {Type IO LastRead -1 FirstWrite -1}
		udpLength_V {Type IO LastRead -1 FirstWrite -1}
		rx_fsm2exh_MetaFifo_s_11 {Type I LastRead 0 FirstWrite -1}
		rx_drop2exhFsm_MetaF_1 {Type I LastRead 0 FirstWrite -1}
		exHeader_header_V {Type IO LastRead -1 FirstWrite -1}
		rxExh2msnTable_upd_r_1 {Type O LastRead -1 FirstWrite 1}
		rx_readReqAddr_pop_r_4 {Type O LastRead -1 FirstWrite 1}
		msnTable2rxExh_rsp_V {Type I LastRead 0 FirstWrite -1}
		exh_lengthFifo_V_V {Type I LastRead 0 FirstWrite -1}
		rx_readReqAddr_pop_r_1 {Type I LastRead 0 FirstWrite -1}
		dmaMeta_dma_length_V {Type IO LastRead -1 FirstWrite -1}
		readReqAddr_V {Type IO LastRead -1 FirstWrite -1}
		rx_exhEventMetaFifo_s_12 {Type O LastRead -1 FirstWrite 1}
		rx_pkgSplitTypeFifo_s_7 {Type O LastRead -1 FirstWrite 1}
		rx_pkgShiftTypeFifo_s_8 {Type O LastRead -1 FirstWrite 1}
		rx_readRequestFifo_V {Type O LastRead -1 FirstWrite 1}
		rx_readReqTable_upd_1 {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	memoryWriteCmd_V_dat { axis {  { m_axis_mem_write_cmd_TDATA out_data 1 96 } } }
	memoryWriteCmd_V_dest_V { axis {  { m_axis_mem_write_cmd_TREADY out_acc 0 1 }  { m_axis_mem_write_cmd_TVALID out_vld 1 1 }  { m_axis_mem_write_cmd_TDEST out_data 1 1 } } }
	rx_fsm2exh_MetaFifo_s_11 { ap_fifo {  { rx_fsm2exh_MetaFifo_s_11_dout fifo_data 0 92 }  { rx_fsm2exh_MetaFifo_s_11_empty_n fifo_status 0 1 }  { rx_fsm2exh_MetaFifo_s_11_read fifo_update 1 1 } } }
	rx_drop2exhFsm_MetaF_1 { ap_fifo {  { rx_drop2exhFsm_MetaF_1_dout fifo_data 0 241 }  { rx_drop2exhFsm_MetaF_1_empty_n fifo_status 0 1 }  { rx_drop2exhFsm_MetaF_1_read fifo_update 1 1 } } }
	rxExh2msnTable_upd_r_1 { ap_fifo {  { rxExh2msnTable_upd_r_1_din fifo_data 1 137 }  { rxExh2msnTable_upd_r_1_full_n fifo_status 0 1 }  { rxExh2msnTable_upd_r_1_write fifo_update 1 1 } } }
	rx_readReqAddr_pop_r_4 { ap_fifo {  { rx_readReqAddr_pop_r_4_din fifo_data 1 17 }  { rx_readReqAddr_pop_r_4_full_n fifo_status 0 1 }  { rx_readReqAddr_pop_r_4_write fifo_update 1 1 } } }
	msnTable2rxExh_rsp_V { ap_fifo {  { msnTable2rxExh_rsp_V_dout fifo_data 0 152 }  { msnTable2rxExh_rsp_V_empty_n fifo_status 0 1 }  { msnTable2rxExh_rsp_V_read fifo_update 1 1 } } }
	exh_lengthFifo_V_V { ap_fifo {  { exh_lengthFifo_V_V_dout fifo_data 0 16 }  { exh_lengthFifo_V_V_empty_n fifo_status 0 1 }  { exh_lengthFifo_V_V_read fifo_update 1 1 } } }
	rx_readReqAddr_pop_r_1 { ap_fifo {  { rx_readReqAddr_pop_r_1_dout fifo_data 0 64 }  { rx_readReqAddr_pop_r_1_empty_n fifo_status 0 1 }  { rx_readReqAddr_pop_r_1_read fifo_update 1 1 } } }
	rx_exhEventMetaFifo_s_12 { ap_fifo {  { rx_exhEventMetaFifo_s_12_din fifo_data 1 50 }  { rx_exhEventMetaFifo_s_12_full_n fifo_status 0 1 }  { rx_exhEventMetaFifo_s_12_write fifo_update 1 1 } } }
	rx_pkgSplitTypeFifo_s_7 { ap_fifo {  { rx_pkgSplitTypeFifo_s_7_din fifo_data 1 6 }  { rx_pkgSplitTypeFifo_s_7_full_n fifo_status 0 1 }  { rx_pkgSplitTypeFifo_s_7_write fifo_update 1 1 } } }
	rx_pkgShiftTypeFifo_s_8 { ap_fifo {  { rx_pkgShiftTypeFifo_s_8_din fifo_data 1 2 }  { rx_pkgShiftTypeFifo_s_8_full_n fifo_status 0 1 }  { rx_pkgShiftTypeFifo_s_8_write fifo_update 1 1 } } }
	rx_readRequestFifo_V { ap_fifo {  { rx_readRequestFifo_V_din fifo_data 1 129 }  { rx_readRequestFifo_V_full_n fifo_status 0 1 }  { rx_readRequestFifo_V_write fifo_update 1 1 } } }
	rx_readReqTable_upd_1 { ap_fifo {  { rx_readReqTable_upd_1_din fifo_data 1 41 }  { rx_readReqTable_upd_1_full_n fifo_status 0 1 }  { rx_readReqTable_upd_1_write fifo_update 1 1 } } }
}
