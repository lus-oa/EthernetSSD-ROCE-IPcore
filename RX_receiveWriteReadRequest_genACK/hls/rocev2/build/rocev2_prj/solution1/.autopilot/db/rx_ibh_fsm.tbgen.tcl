set moduleName rx_ibh_fsm
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
set C_modelName {rx_ibh_fsm}
set C_modelType { void 0 }
set C_modelArgList {
	{ regInvalidPsnDropCount_V int 32 regular {pointer 1}  }
	{ rx_ibh2fsm_MetaFifo_s_9 int 92 regular {fifo 0 volatile } {global 0}  }
	{ rx_exhMetaFifo_V int 23 regular {fifo 0 volatile } {global 0}  }
	{ rxIbh2stateTable_upd_1 int 45 regular {fifo 1 volatile } {global 1}  }
	{ stateTable2rxIbh_rsp_1 int 75 regular {fifo 0 volatile } {global 0}  }
	{ rx_ibhDropFifo_V int 1 regular {fifo 1 volatile } {global 1}  }
	{ rx_ibhDropMetaFifo_V int 2 regular {fifo 1 volatile } {global 1}  }
	{ rx_fsm2exh_MetaFifo_s_11 int 92 regular {fifo 1 volatile } {global 1}  }
	{ rx_ibhEventFifo_V int 50 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "regInvalidPsnDropCount_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "rx_ibh2fsm_MetaFifo_s_9", "interface" : "fifo", "bitwidth" : 92, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_exhMetaFifo_V", "interface" : "fifo", "bitwidth" : 23, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rxIbh2stateTable_upd_1", "interface" : "fifo", "bitwidth" : 45, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "stateTable2rxIbh_rsp_1", "interface" : "fifo", "bitwidth" : 75, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDropFifo_V", "interface" : "fifo", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhDropMetaFifo_V", "interface" : "fifo", "bitwidth" : 2, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_fsm2exh_MetaFifo_s_11", "interface" : "fifo", "bitwidth" : 92, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "rx_ibhEventFifo_V", "interface" : "fifo", "bitwidth" : 50, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 33
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ rx_ibh2fsm_MetaFifo_s_9_dout sc_in sc_lv 92 signal 1 } 
	{ rx_ibh2fsm_MetaFifo_s_9_empty_n sc_in sc_logic 1 signal 1 } 
	{ rx_ibh2fsm_MetaFifo_s_9_read sc_out sc_logic 1 signal 1 } 
	{ rx_exhMetaFifo_V_dout sc_in sc_lv 23 signal 2 } 
	{ rx_exhMetaFifo_V_empty_n sc_in sc_logic 1 signal 2 } 
	{ rx_exhMetaFifo_V_read sc_out sc_logic 1 signal 2 } 
	{ stateTable2rxIbh_rsp_1_dout sc_in sc_lv 75 signal 4 } 
	{ stateTable2rxIbh_rsp_1_empty_n sc_in sc_logic 1 signal 4 } 
	{ stateTable2rxIbh_rsp_1_read sc_out sc_logic 1 signal 4 } 
	{ rxIbh2stateTable_upd_1_din sc_out sc_lv 45 signal 3 } 
	{ rxIbh2stateTable_upd_1_full_n sc_in sc_logic 1 signal 3 } 
	{ rxIbh2stateTable_upd_1_write sc_out sc_logic 1 signal 3 } 
	{ rx_ibhDropFifo_V_din sc_out sc_lv 1 signal 5 } 
	{ rx_ibhDropFifo_V_full_n sc_in sc_logic 1 signal 5 } 
	{ rx_ibhDropFifo_V_write sc_out sc_logic 1 signal 5 } 
	{ rx_ibhDropMetaFifo_V_din sc_out sc_lv 2 signal 6 } 
	{ rx_ibhDropMetaFifo_V_full_n sc_in sc_logic 1 signal 6 } 
	{ rx_ibhDropMetaFifo_V_write sc_out sc_logic 1 signal 6 } 
	{ rx_ibhEventFifo_V_din sc_out sc_lv 50 signal 8 } 
	{ rx_ibhEventFifo_V_full_n sc_in sc_logic 1 signal 8 } 
	{ rx_ibhEventFifo_V_write sc_out sc_logic 1 signal 8 } 
	{ rx_fsm2exh_MetaFifo_s_11_din sc_out sc_lv 92 signal 7 } 
	{ rx_fsm2exh_MetaFifo_s_11_full_n sc_in sc_logic 1 signal 7 } 
	{ rx_fsm2exh_MetaFifo_s_11_write sc_out sc_logic 1 signal 7 } 
	{ regInvalidPsnDropCount_V sc_out sc_lv 32 signal 0 } 
	{ regInvalidPsnDropCount_V_ap_vld sc_out sc_logic 1 outvld 0 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "rx_ibh2fsm_MetaFifo_s_9_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":92, "type": "signal", "bundle":{"name": "rx_ibh2fsm_MetaFifo_s_9", "role": "dout" }} , 
 	{ "name": "rx_ibh2fsm_MetaFifo_s_9_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibh2fsm_MetaFifo_s_9", "role": "empty_n" }} , 
 	{ "name": "rx_ibh2fsm_MetaFifo_s_9_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibh2fsm_MetaFifo_s_9", "role": "read" }} , 
 	{ "name": "rx_exhMetaFifo_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":23, "type": "signal", "bundle":{"name": "rx_exhMetaFifo_V", "role": "dout" }} , 
 	{ "name": "rx_exhMetaFifo_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhMetaFifo_V", "role": "empty_n" }} , 
 	{ "name": "rx_exhMetaFifo_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_exhMetaFifo_V", "role": "read" }} , 
 	{ "name": "stateTable2rxIbh_rsp_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":75, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp_1", "role": "dout" }} , 
 	{ "name": "stateTable2rxIbh_rsp_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp_1", "role": "empty_n" }} , 
 	{ "name": "stateTable2rxIbh_rsp_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stateTable2rxIbh_rsp_1", "role": "read" }} , 
 	{ "name": "rxIbh2stateTable_upd_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":45, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_1", "role": "din" }} , 
 	{ "name": "rxIbh2stateTable_upd_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_1", "role": "full_n" }} , 
 	{ "name": "rxIbh2stateTable_upd_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rxIbh2stateTable_upd_1", "role": "write" }} , 
 	{ "name": "rx_ibhDropFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo_V", "role": "din" }} , 
 	{ "name": "rx_ibhDropFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo_V", "role": "full_n" }} , 
 	{ "name": "rx_ibhDropFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropFifo_V", "role": "write" }} , 
 	{ "name": "rx_ibhDropMetaFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo_V", "role": "din" }} , 
 	{ "name": "rx_ibhDropMetaFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo_V", "role": "full_n" }} , 
 	{ "name": "rx_ibhDropMetaFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhDropMetaFifo_V", "role": "write" }} , 
 	{ "name": "rx_ibhEventFifo_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":50, "type": "signal", "bundle":{"name": "rx_ibhEventFifo_V", "role": "din" }} , 
 	{ "name": "rx_ibhEventFifo_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhEventFifo_V", "role": "full_n" }} , 
 	{ "name": "rx_ibhEventFifo_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_ibhEventFifo_V", "role": "write" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_s_11_din", "direction": "out", "datatype": "sc_lv", "bitwidth":92, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo_s_11", "role": "din" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_s_11_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo_s_11", "role": "full_n" }} , 
 	{ "name": "rx_fsm2exh_MetaFifo_s_11_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "rx_fsm2exh_MetaFifo_s_11", "role": "write" }} , 
 	{ "name": "regInvalidPsnDropCount_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "regInvalidPsnDropCount_V", "role": "default" }} , 
 	{ "name": "regInvalidPsnDropCount_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "regInvalidPsnDropCount_V", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "rx_ibh_fsm",
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
			{"Name" : "regInvalidPsnDropCount_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "fsmState_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_op_code_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_partition_key_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_dest_qp_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_psn_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_validPSN", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "meta_numPkg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "emeta_isNak", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "isResponse", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_ibh2fsm_MetaFifo_s_9", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibh2fsm_MetaFifo_s_9_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_exhMetaFifo_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_exhMetaFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "emeta_numPkg_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rxIbh2stateTable_upd_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rxIbh2stateTable_upd_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "stateTable2rxIbh_rsp_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "stateTable2rxIbh_rsp_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhDropFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDropFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_ibhDropMetaFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhDropMetaFifo_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "rx_fsm2exh_MetaFifo_s_11", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_fsm2exh_MetaFifo_s_11_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "droppedPackets_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "rx_ibhEventFifo_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "rx_ibhEventFifo_V_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.rocev2_top_mux_325_1_1_1_U121", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	rx_ibh_fsm {
		regInvalidPsnDropCount_V {Type O LastRead -1 FirstWrite 1}
		fsmState_4 {Type IO LastRead -1 FirstWrite -1}
		meta_op_code_9 {Type IO LastRead -1 FirstWrite -1}
		meta_partition_key_V {Type IO LastRead -1 FirstWrite -1}
		meta_dest_qp_V {Type IO LastRead -1 FirstWrite -1}
		meta_psn_V {Type IO LastRead -1 FirstWrite -1}
		meta_validPSN {Type IO LastRead -1 FirstWrite -1}
		meta_numPkg_V {Type IO LastRead -1 FirstWrite -1}
		emeta_isNak {Type IO LastRead -1 FirstWrite -1}
		isResponse {Type IO LastRead -1 FirstWrite -1}
		rx_ibh2fsm_MetaFifo_s_9 {Type I LastRead 0 FirstWrite -1}
		rx_exhMetaFifo_V {Type I LastRead 0 FirstWrite -1}
		emeta_numPkg_V {Type IO LastRead -1 FirstWrite -1}
		rxIbh2stateTable_upd_1 {Type O LastRead -1 FirstWrite 1}
		stateTable2rxIbh_rsp_1 {Type I LastRead 0 FirstWrite -1}
		rx_ibhDropFifo_V {Type O LastRead -1 FirstWrite 1}
		rx_ibhDropMetaFifo_V {Type O LastRead -1 FirstWrite 1}
		rx_fsm2exh_MetaFifo_s_11 {Type O LastRead -1 FirstWrite 1}
		droppedPackets_V {Type IO LastRead -1 FirstWrite -1}
		rx_ibhEventFifo_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	regInvalidPsnDropCount_V { ap_vld {  { regInvalidPsnDropCount_V out_data 1 32 }  { regInvalidPsnDropCount_V_ap_vld out_vld 1 1 } } }
	rx_ibh2fsm_MetaFifo_s_9 { ap_fifo {  { rx_ibh2fsm_MetaFifo_s_9_dout fifo_data 0 92 }  { rx_ibh2fsm_MetaFifo_s_9_empty_n fifo_status 0 1 }  { rx_ibh2fsm_MetaFifo_s_9_read fifo_update 1 1 } } }
	rx_exhMetaFifo_V { ap_fifo {  { rx_exhMetaFifo_V_dout fifo_data 0 23 }  { rx_exhMetaFifo_V_empty_n fifo_status 0 1 }  { rx_exhMetaFifo_V_read fifo_update 1 1 } } }
	rxIbh2stateTable_upd_1 { ap_fifo {  { rxIbh2stateTable_upd_1_din fifo_data 1 45 }  { rxIbh2stateTable_upd_1_full_n fifo_status 0 1 }  { rxIbh2stateTable_upd_1_write fifo_update 1 1 } } }
	stateTable2rxIbh_rsp_1 { ap_fifo {  { stateTable2rxIbh_rsp_1_dout fifo_data 0 75 }  { stateTable2rxIbh_rsp_1_empty_n fifo_status 0 1 }  { stateTable2rxIbh_rsp_1_read fifo_update 1 1 } } }
	rx_ibhDropFifo_V { ap_fifo {  { rx_ibhDropFifo_V_din fifo_data 1 1 }  { rx_ibhDropFifo_V_full_n fifo_status 0 1 }  { rx_ibhDropFifo_V_write fifo_update 1 1 } } }
	rx_ibhDropMetaFifo_V { ap_fifo {  { rx_ibhDropMetaFifo_V_din fifo_data 1 2 }  { rx_ibhDropMetaFifo_V_full_n fifo_status 0 1 }  { rx_ibhDropMetaFifo_V_write fifo_update 1 1 } } }
	rx_fsm2exh_MetaFifo_s_11 { ap_fifo {  { rx_fsm2exh_MetaFifo_s_11_din fifo_data 1 92 }  { rx_fsm2exh_MetaFifo_s_11_full_n fifo_status 0 1 }  { rx_fsm2exh_MetaFifo_s_11_write fifo_update 1 1 } } }
	rx_ibhEventFifo_V { ap_fifo {  { rx_ibhEventFifo_V_din fifo_data 1 50 }  { rx_ibhEventFifo_V_full_n fifo_status 0 1 }  { rx_ibhEventFifo_V_write fifo_update 1 1 } } }
}
