set moduleName tx_ipUdpMetaMerger
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
set C_modelName {tx_ipUdpMetaMerger}
set C_modelType { void 0 }
set C_modelArgList {
	{ tx_connTable2ibh_rsp_1 int 168 regular {fifo 0 volatile } {global 0}  }
	{ tx_lengthFifo_V_V int 16 regular {fifo 0 volatile } {global 0}  }
	{ tx_ipUdpMetaFifo_V_t_1 int 128 regular {fifo 1 volatile } {global 1}  }
	{ tx_ipUdpMetaFifo_V_t int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_ipUdpMetaFifo_V_m int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_ipUdpMetaFifo_V_l int 16 regular {fifo 1 volatile } {global 1}  }
	{ tx_dstQpFifo_V_V int 24 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "tx_connTable2ibh_rsp_1", "interface" : "fifo", "bitwidth" : 168, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_lengthFifo_V_V", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "tx_ipUdpMetaFifo_V_t_1", "interface" : "fifo", "bitwidth" : 128, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ipUdpMetaFifo_V_t", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ipUdpMetaFifo_V_m", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_ipUdpMetaFifo_V_l", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "tx_dstQpFifo_V_V", "interface" : "fifo", "bitwidth" : 24, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ tx_connTable2ibh_rsp_1_dout sc_in sc_lv 168 signal 0 } 
	{ tx_connTable2ibh_rsp_1_empty_n sc_in sc_logic 1 signal 0 } 
	{ tx_connTable2ibh_rsp_1_read sc_out sc_logic 1 signal 0 } 
	{ tx_lengthFifo_V_V_dout sc_in sc_lv 16 signal 1 } 
	{ tx_lengthFifo_V_V_empty_n sc_in sc_logic 1 signal 1 } 
	{ tx_lengthFifo_V_V_read sc_out sc_logic 1 signal 1 } 
	{ tx_ipUdpMetaFifo_V_t_1_din sc_out sc_lv 128 signal 2 } 
	{ tx_ipUdpMetaFifo_V_t_1_full_n sc_in sc_logic 1 signal 2 } 
	{ tx_ipUdpMetaFifo_V_t_1_write sc_out sc_logic 1 signal 2 } 
	{ tx_ipUdpMetaFifo_V_t_din sc_out sc_lv 16 signal 3 } 
	{ tx_ipUdpMetaFifo_V_t_full_n sc_in sc_logic 1 signal 3 } 
	{ tx_ipUdpMetaFifo_V_t_write sc_out sc_logic 1 signal 3 } 
	{ tx_ipUdpMetaFifo_V_m_din sc_out sc_lv 16 signal 4 } 
	{ tx_ipUdpMetaFifo_V_m_full_n sc_in sc_logic 1 signal 4 } 
	{ tx_ipUdpMetaFifo_V_m_write sc_out sc_logic 1 signal 4 } 
	{ tx_ipUdpMetaFifo_V_l_din sc_out sc_lv 16 signal 5 } 
	{ tx_ipUdpMetaFifo_V_l_full_n sc_in sc_logic 1 signal 5 } 
	{ tx_ipUdpMetaFifo_V_l_write sc_out sc_logic 1 signal 5 } 
	{ tx_dstQpFifo_V_V_din sc_out sc_lv 24 signal 6 } 
	{ tx_dstQpFifo_V_V_full_n sc_in sc_logic 1 signal 6 } 
	{ tx_dstQpFifo_V_V_write sc_out sc_logic 1 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "tx_connTable2ibh_rsp_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":168, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp_1", "role": "dout" }} , 
 	{ "name": "tx_connTable2ibh_rsp_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp_1", "role": "empty_n" }} , 
 	{ "name": "tx_connTable2ibh_rsp_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_connTable2ibh_rsp_1", "role": "read" }} , 
 	{ "name": "tx_lengthFifo_V_V_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_lengthFifo_V_V", "role": "dout" }} , 
 	{ "name": "tx_lengthFifo_V_V_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_lengthFifo_V_V", "role": "empty_n" }} , 
 	{ "name": "tx_lengthFifo_V_V_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_lengthFifo_V_V", "role": "read" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_1_din", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t_1", "role": "din" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_1_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t_1", "role": "full_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_1_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t_1", "role": "write" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t", "role": "din" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t", "role": "full_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_t_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_t", "role": "write" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_m_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_m", "role": "din" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_m_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_m", "role": "full_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_m_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_m", "role": "write" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_l_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_l", "role": "din" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_l_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_l", "role": "full_n" }} , 
 	{ "name": "tx_ipUdpMetaFifo_V_l_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_ipUdpMetaFifo_V_l", "role": "write" }} , 
 	{ "name": "tx_dstQpFifo_V_V_din", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "tx_dstQpFifo_V_V", "role": "din" }} , 
 	{ "name": "tx_dstQpFifo_V_V_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_dstQpFifo_V_V", "role": "full_n" }} , 
 	{ "name": "tx_dstQpFifo_V_V_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "tx_dstQpFifo_V_V", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "tx_ipUdpMetaMerger",
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
			{"Name" : "tx_connTable2ibh_rsp_1", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_connTable2ibh_rsp_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_lengthFifo_V_V", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_lengthFifo_V_V_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ipUdpMetaFifo_V_t_1", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_V_t_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ipUdpMetaFifo_V_t", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_V_t_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ipUdpMetaFifo_V_m", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_V_m_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_ipUdpMetaFifo_V_l", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_ipUdpMetaFifo_V_l_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "tx_dstQpFifo_V_V", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "tx_dstQpFifo_V_V_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	tx_ipUdpMetaMerger {
		tx_connTable2ibh_rsp_1 {Type I LastRead 0 FirstWrite -1}
		tx_lengthFifo_V_V {Type I LastRead 0 FirstWrite -1}
		tx_ipUdpMetaFifo_V_t_1 {Type O LastRead -1 FirstWrite 1}
		tx_ipUdpMetaFifo_V_t {Type O LastRead -1 FirstWrite 1}
		tx_ipUdpMetaFifo_V_m {Type O LastRead -1 FirstWrite 1}
		tx_ipUdpMetaFifo_V_l {Type O LastRead -1 FirstWrite 1}
		tx_dstQpFifo_V_V {Type O LastRead -1 FirstWrite 1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "1"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	tx_connTable2ibh_rsp_1 { ap_fifo {  { tx_connTable2ibh_rsp_1_dout fifo_data 0 168 }  { tx_connTable2ibh_rsp_1_empty_n fifo_status 0 1 }  { tx_connTable2ibh_rsp_1_read fifo_update 1 1 } } }
	tx_lengthFifo_V_V { ap_fifo {  { tx_lengthFifo_V_V_dout fifo_data 0 16 }  { tx_lengthFifo_V_V_empty_n fifo_status 0 1 }  { tx_lengthFifo_V_V_read fifo_update 1 1 } } }
	tx_ipUdpMetaFifo_V_t_1 { ap_fifo {  { tx_ipUdpMetaFifo_V_t_1_din fifo_data 1 128 }  { tx_ipUdpMetaFifo_V_t_1_full_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_V_t_1_write fifo_update 1 1 } } }
	tx_ipUdpMetaFifo_V_t { ap_fifo {  { tx_ipUdpMetaFifo_V_t_din fifo_data 1 16 }  { tx_ipUdpMetaFifo_V_t_full_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_V_t_write fifo_update 1 1 } } }
	tx_ipUdpMetaFifo_V_m { ap_fifo {  { tx_ipUdpMetaFifo_V_m_din fifo_data 1 16 }  { tx_ipUdpMetaFifo_V_m_full_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_V_m_write fifo_update 1 1 } } }
	tx_ipUdpMetaFifo_V_l { ap_fifo {  { tx_ipUdpMetaFifo_V_l_din fifo_data 1 16 }  { tx_ipUdpMetaFifo_V_l_full_n fifo_status 0 1 }  { tx_ipUdpMetaFifo_V_l_write fifo_update 1 1 } } }
	tx_dstQpFifo_V_V { ap_fifo {  { tx_dstQpFifo_V_V_din fifo_data 1 24 }  { tx_dstQpFifo_V_V_full_n fifo_status 0 1 }  { tx_dstQpFifo_V_V_write fifo_update 1 1 } } }
}
